// multiple layers of structs with optional primitives
struct Leaf {
  val: Int?;
}

struct Mid {
  l: Leaf;
  flag: Bool;
}

struct Root {
  m: Mid;
  text: String?
}

contract TestContract {
  state: Root;
  init() {
    self.state = Root{
      m: Mid{
        l: Leaf{val: null},
        flag: true
      },
      text: null
    };
  }
}