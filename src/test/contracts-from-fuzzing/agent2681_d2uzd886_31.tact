struct Wrap1 {
  val: Int;
}

struct Wrap2 {
  w: Wrap1;
}

struct Wrap3 {
  w: Wrap2;
}

struct Wrap4 {
  w: Wrap3;
}

contract DeepWrap {
  wrap: Wrap4;

  init() {
    self.wrap = Wrap4{
      w: Wrap3{
        w: Wrap2{
          w: Wrap1{val: 999}
        }
      }
    };
  }
}