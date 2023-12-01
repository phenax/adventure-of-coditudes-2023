⟨ParseInt⟩ ← •Import "../utils.bqn"

input ← •FLines "./input.txt"

numbers ← ⟨"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
IsDigit ← ≥⟜'0'∧≤⟜'9'
AsNum ← {𝕊 str: {0: +⟜'0' ⊑⊒⟜1 (≤○≠◶0‿(⊣≡≠⊸↑)⟜str)¨ numbers; ⊑str} IsDigit ⊑str}

Solve1 ← 0(ParseInt⊸+)´ ({(0⊑𝕩)‿((¯1)⊑𝕩)} IsDigit⊸/)¨
Solve2 ← 0(ParseInt⊸+)´ {{(0⊑𝕩)‿((¯1)⊑𝕩)} ≤⟜'9'⊸/ (AsNum ↓⟜𝕩) ¨ ↕≠𝕩}¨

•Show "solve 1"‿(Solve1 input)
•Show "solve 2"‿(Solve2 input)
