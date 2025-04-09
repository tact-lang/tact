struct Base {
  foo: Int;
}

struct Wrapper1 {
  base: Base;
}

struct Wrapper2 {
  wrap: Wrapper1;
}

struct Wrapper3 {
  wrap: Wrapper2;
}

contract MultiWrap {
  val: Wrapper3;

  init() {
    self.val = Wrapper3{
      wrap: Wrapper2{
        wrap: Wrapper1{
          base: Base{foo: 123}
        }
      }
    };
  }
}
