struct Inner {
  flag: Bool;
  optInt: Int?;
}

struct Outer {
  s: Slice;
  nested: Inner?;
}

contract TestContract {
  outerOpt: Outer?;

  init() {
    self.outerOpt = Outer{
      s: emptyCell().asSlice(),
      nested: Inner{
        flag: true,
        optInt: 0,
      },
    };
  }
}