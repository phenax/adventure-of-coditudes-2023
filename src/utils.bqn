
ParseInt ⇐ 10⊸×⊸+˜´∘⌽-⟜'0'

Split ⇐ ((⊢-˜+`×¬)∘=)⊔⊢

IsDigit ⇐ ≥⟜'0'∧≤⟜'9'

TakeNatInternal ← { n 𝕊 str:
  { 1: (n∾1↑str) TakeNatInternal (1↓str); ⟨ParseInt n, str⟩ } IsDigit ⊑str
}
TakeNat ⇐ ""⊸TakeNatInternal

EatSpaces ⇐ (»⊸∨' '⊸≠)⊸/

# Tests
! 1 ≡ IsDigit '2'
! 0 ≡ IsDigit 'a'
! ⟨1230,"test"⟩ ≡ TakeNat "01230test"
! "hello " ≡ EatSpaces "  hello "
! ⟨"hello","world"⟩ ≡ ' ' Split "hello world"
