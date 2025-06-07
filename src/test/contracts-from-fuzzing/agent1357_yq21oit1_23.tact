struct Leaf { a: Int = 1; b: Bool?; }
struct Branch { l: Leaf; c: String?; }
struct Root { b1: Branch; b2: Branch; flag: Bool?; }

contract LargeDeep {
  tree: Root = Root{
    b1: Branch{ l: Leaf{} },
    b2: Branch{ l: Leaf{ a: 5 } },
  };
}