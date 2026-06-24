struct Inner {
  i: Int;
  flag: Bool;
}

struct Mid {
  inner: Inner;
  message: String?;
}

struct Outer {
  mid: Mid;
  count: Int;
}

contract NestedStructsTest {
  st: Outer;

  init() {
    self.st = Outer{
      mid: Mid{
        inner: Inner{
          i: 1,
          flag: true,
        },
        message: null,
      },
      count: 5,
    };
  }
}