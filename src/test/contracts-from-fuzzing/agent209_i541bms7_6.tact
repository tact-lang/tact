// Testing deeply nested structs with optional fields
struct Leaf {
  val: Int?;
}

struct Middle {
  nested: Leaf?;
}

struct Root {
  inner: Middle?;
}

contract NestOptContract {
  tree: Root;

  init() {
    self.tree = Root{
      inner: Middle{
        nested: Leaf{
          val: 777
        }
      }
    };
  }
}