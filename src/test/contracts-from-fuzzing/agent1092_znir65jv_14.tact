struct Wrap {
  data: Int;
}

struct Outer {
  first: Wrap;
  second: Wrap;
  third: Wrap;
}

contract MultiWrap {
  payload: Outer;

  init() {
    self.payload = Outer{
      first: Wrap{data:1},
      second: Wrap{data:2},
      third: Wrap{data:3}
    };
  }
}
