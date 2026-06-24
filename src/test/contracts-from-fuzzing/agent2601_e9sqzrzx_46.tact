struct S1 {
 x: Int;
 b: Bool;
}
struct S2 {
 y: Int;
 s: String;
}
contract SeveralStructs {
  a: S1;
  c: S2;
  init() {
    self.a = S1{ x:1, b:true };
    self.c = S2{ y:2, s:"hi" };
  }
}