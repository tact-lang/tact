// Contract with nested mix of optionals, deep, with diverse types
struct Leaf {
  a: Int?;
  b: String?;
  c: Bool?;
}

struct Middle {
  l1: Leaf?;
  l2: Leaf?;
}

struct Root {
  m: Middle?;
}

contract Tree {
  root: Root;

  init() {
    self.root = Root{
      m: Middle{
        l1: Leaf{ a:1, b:null, c:true },
        l2: null
      }
    };
  }
}
