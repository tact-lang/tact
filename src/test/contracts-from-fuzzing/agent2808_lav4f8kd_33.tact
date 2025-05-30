struct Node {
  inner1: Inner?;
  opInt: Int?;
  opBool: Bool?;
  opStr: String?;
  inner2: Inner?;
}

struct Inner {
  value: Int;
}

contract Test {
  bigOpt: Node?;
  init() {
    self.bigOpt = null;
  }
}