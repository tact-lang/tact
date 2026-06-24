// Large contract parameter list nested and optionals
struct Deep1 {
  x: Int?;
}
struct Deep2 {
  d1: Deep1?;
}
struct Deep3 {
  d2: Deep2?;
}
contract ParamDeepMix(
  p1: Deep3?,
  p2: Deep2?,
  p3: Deep1?,
  p4: Int?,
  p5: Bool?,
) {
  receive() {}
}