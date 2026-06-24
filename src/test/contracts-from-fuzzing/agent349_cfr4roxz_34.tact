// Compose optional struct + optional int fields arrayed many times
struct OptInt {
  val: Int?;
}

contract MultiOptInts {
  a: OptInt?;
  b: OptInt?;
  c: OptInt?;
  d: OptInt?;
  e: OptInt?;
  init() {
    self.a = null;
    self.b = OptInt{ val: 123 };
    self.c = null;
    self.d = OptInt{ val: null };
    self.e = null;
  }
}