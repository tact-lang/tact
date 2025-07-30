struct CurlA {
  b: CurlB;
}

struct CurlB {
  c: CurlC;
}

struct CurlC {
  d: Int;
}

contract CurlTest {
  a: CurlA;

  init() {
    self.a = CurlA{b: CurlB{c: CurlC{d: 777}}};
  }
}