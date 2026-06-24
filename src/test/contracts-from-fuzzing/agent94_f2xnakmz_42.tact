struct WrapA {
  a: Int;
}

struct WrapB {
  b: WrapA;
}

struct WrapC {
  c: WrapB;
}

contract DeepWrap {
  data: WrapC;

  init() {
    self.data = WrapC{
      c: WrapB{
        b: WrapA{ a: 11 }
      }
    };
  }
}