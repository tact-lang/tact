struct Leaf {
  value: Int as int16 = -7;
  valid: Bool = true;
}

struct Middle {
  left: Leaf? = null;
  right: Leaf? = Leaf{};
}

struct Root {
  first: Middle;
  second: Middle? = null;
  flag1: Bool?;
  num: Int? as uint32;
  flag2: Bool?;
}

contract TestContract {
  tree: Root;

  init() {
    self.tree = Root{
      first: Middle{
        left: Leaf{ value: 123, valid: false },
        right: null
      },
      // second left null
      flag1: true,
      num: 255,
      flag2: null
    };
  }
}