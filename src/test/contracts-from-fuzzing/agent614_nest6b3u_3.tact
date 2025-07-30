struct Deep {
  a: Int;
  b: String?;
}

struct Middle {
  inner: Deep;
  flag: Bool;
}

struct Outer {
  mid: Middle;
  info: String;
}

contract TestContract {
  record: Outer;

  init() {
    self.record = Outer{
      mid: Middle{
        inner: Deep{
          a: 5,
          b: null
        },
        flag: false
      },
      info: "data"
    };
  }
}