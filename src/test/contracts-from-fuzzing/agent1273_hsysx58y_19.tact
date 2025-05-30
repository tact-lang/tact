// deeply nested persistent optional booleans
struct Leaf {
  flag: Bool?;
}

struct Lev2 {
  nested: Leaf?;
}

struct Lev1 {
  nested: Lev2?;
}

contract TestContract {
  root: Lev1;

  init() {
    self.root = Lev1{
      nested: Lev2{
        nested: Leaf{ flag: null }
      }
    };
  }
}