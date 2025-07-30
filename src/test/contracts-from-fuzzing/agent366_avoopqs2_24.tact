struct MyS {
  x: Int;
  y: String;
}

struct MyOuter {
  s: MyS?;
  z: Bool?;
}

contract OuterContract {
  val: MyOuter;
  init() {
    self.val = MyOuter{
      s: null,
      z: null
    };
  }
}