struct MixedDepth {
  a: Int;
  b: Inner1;
  c: Int;
}

struct Inner1 {
  d: Int;
  e: Inner2;
}

struct Inner2 {
  f: Int;
  g: Int;
}

contract MixedDepthTest {
  m: MixedDepth;

  init() {
    self.m = MixedDepth{
      a:1, b: Inner1{ d:2, e: Inner2{ f:3, g:4 } }, c:5
    };
  }
}