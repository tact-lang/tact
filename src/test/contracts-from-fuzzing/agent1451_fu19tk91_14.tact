struct Inner {
  s: String?;
  n: Int?;
}

struct Outer {
  inn: Inner;
}

contract InitDeep {
  val: Outer;

  init() {
    self.val = Outer{
      inn: Inner{
        s: "abc",
        n: 42,
      },
    };
  }

  receive() {
    self.val = self.val;
  }
}