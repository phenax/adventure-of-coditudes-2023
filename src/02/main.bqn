⟨ParseInt, IsDigit, TakeNat, EatSpaces, Split⟩ ← •Import "../utils.bqn"

input ← •FLines "./input.txt"

IsValidCount ← {𝕊 ⟨n, c⟩: {'r': n ≤ 12; 'g': n ≤ 13; 'b': n ≤ 14; 0} ⊑EatSpaces c }
GrId ← ⊑∘("rgb"⊸⊐) ⊑∘EatSpaces

Solve1 ← +´ { 𝕊⟨n, rest⟩:
  n×0=⊑0∊∾´IsValidCount¨¨(TakeNat∘EatSpaces¨','⊸Split) ¨ ';' Split 1↓rest
}∘TakeNat∘(5⊸↓) ¨

Solve2 ← +´ { 𝕊⟨n, rest⟩:
  ×´⊑∘∨¨ ⊑¨¨ (GrId∘⊑ 1⊸↓)¨⊸⊔ ∾´(TakeNat∘EatSpaces¨','⊸Split)¨ ';' Split 1↓rest
}∘TakeNat∘(5⊸↓) ¨

•Show "solution 1"‿(Solve1 input)
•Show "solution 2"‿(Solve2 input)

# Tests
! 2447 ≡ Solve1 input
! 56322 ≡ Solve2 input
