struct Middle {
  m: Int;
  deep: Bottom;
}

struct Bottom {
  flag: Bool?;
  message: String;
}

contract NestedMix {
  val: Middle;
  init() {
    self.val = Middle{
      m: 9,
      deep: Bottom{ flag: null, message: "hey" }
    };
  }
}