struct DeepInner {
  num: Int;
  txt: String;
  flag: Bool;
}

struct Middle {
  deep: DeepInner;
  opt: Bool?;
}

struct Outer {
  middle: Middle;
  val: Int;
}

contract TestContract {
  store: Outer;
  init() {
    self.store = Outer{
      middle: Middle{
        deep: DeepInner{num: 7, txt: "hey", flag: true},
        opt: null,
      },
      val: 5,
    };
  }
}