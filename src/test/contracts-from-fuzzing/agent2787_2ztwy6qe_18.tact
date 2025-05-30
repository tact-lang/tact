struct S1 { x: Int }
struct S2 { x: Int }
contract ManyParams(
  f1: Int,
  f2: Bool,
  s1: S1,
  s2: S2,
  opt: Bool?,
  opt2: Int?,
  embedded: S1?,
  flag: Bool
) {}
