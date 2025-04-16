struct Leaf { l1: Int; l2: Bool; }
struct Mid { m1: Leaf; m2: Leaf; }
struct Root { r1: Mid; r2: Mid; }

contract TreeStorage {
  storage: Root;

  init() {
    self.storage = Root{
      r1: Mid{ m1: Leaf{ l1:1, l2:true }, m2: Leaf{ l1:2, l2:false } },
      r2: Mid{ m1: Leaf{ l1:3, l2:true }, m2: Leaf{ l1:4, l2:false } }
    };
  }
}