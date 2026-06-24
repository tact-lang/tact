struct LargeNested {
  first: String;
  nest1: Inner1;
  nest2: Inner2;
  last: Int;
}

struct Inner1 {
  flag: Bool;
  data: String;
}

struct Inner2 {
  val: Int;
  opt: Int?;
}

contract Test {
  big: LargeNested;

  init() {
    self.big = LargeNested{
      first: "hi",
      nest1: Inner1{flag: true, data: "d"},
      nest2: Inner2{val: 5, opt: null},
      last: 10
    };
  }
}
