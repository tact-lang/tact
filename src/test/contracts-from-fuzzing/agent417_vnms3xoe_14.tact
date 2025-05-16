struct Opts {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct Wrap1 {
  x: Opts;
}

struct Wrap2 {
  y: Wrap1;
}

contract NestedOptionals {
  val: Wrap2;

  init() {
    self.val = Wrap2{
      y: Wrap1{
        x: Opts{
          a: null,
          b: false,
          c: null
        }
      }
    };
  }
}