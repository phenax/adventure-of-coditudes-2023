⟨ParseInt, IsDigit, TakeNat, EatSpaces, Split⟩ ← •Import "../utils.bqn"

input ← •FLines "./input.txt"

Parse ← {𝕊 grid:
  numbers ⇐ ⟨⟩ ⋄ symbols ⇐ ⟨⟩
  {𝕊 ⟨line, row⟩:
    n ← "" ⋄ start ← 0
    {𝕊 ⟨char, col⟩:
      {
        1: start↩ >⟜0∘≠◶⟨col,start⟩ n ⋄ n∾↩⟨char⟩;
        numbers∾↩ ({0:⟨⟩; ⟨⟨ParseInt n, row, start, col⟩⟩} ≠n)
        n↩"" ⋄ start↩0
        { '.': @; symbols∾↩⟨⟨char, row, col⟩⟩ } char
      } IsDigit char
    }¨ ⋈¨⟜↕⟜≠ line
  }¨ ⋈¨⟜↕⟜≠ ∾⟜"."¨ grid
}

directions ← ⟨⟨-1, -1⟩, ⟨-1, 0⟩, ⟨-1, 1⟩, ⟨0, -1⟩, ⟨0, 1⟩, ⟨1, -1⟩, ⟨1, 0⟩, ⟨1, 1⟩⟩
IsNearSym ← {⟨num, nr, nstart, nend⟩ 𝕊 symbols:
  ∨´{𝕊⟨sym, sr, sc⟩:
    ∨´{𝕊n: ∨´{𝕊 ⟨r, c⟩: ⟨r + nr, c + n⟩ ≡ ⟨sr, sc⟩ }¨ directions }¨ nstart {𝕨+↕𝕩-𝕨} nend
  }¨symbols
}
NumNeighbors ← {sym 𝕊 numbers: IsNearSym⟜⟨sym⟩¨⊸/numbers}

Solve1 ← {𝕊 r: +´⊑¨IsNearSym⟜r.symbols¨⊸/ r.numbers} Parse
Solve2 ← {𝕊 r: +´(×´⊑¨)¨=⟜2∘≠¨⊸/ NumNeighbors⟜r.numbers¨ '*'⊸=∘⊑¨⊸/r.symbols} Parse

⟨s1, s2⟩ ← ⟨Solve1 input, Solve2 input⟩

•Show "solution 1"‿s1
•Show "solution 2"‿s2

# Tests
# ! 4361 ≡ s1
# ! 467835 ≡ s2
! 549908 ≡ s1
! 81166799 ≡ s2
