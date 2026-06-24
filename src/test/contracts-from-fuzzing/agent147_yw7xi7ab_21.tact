struct Rec1 {
  n: Rec2?;
}
struct Rec2 {
  x: Rec3?;
}
struct Rec3 {
  y: Int;
}
contract RecTest {
  r: Rec1;
  init() {
    self.r = Rec1{ n: null };
  }
}