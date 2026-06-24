struct Leaf {
  score: Int = 2;
  flag: Bool = false;
}

struct Middle {
  leaf: Leaf;
}

struct Outer {
  mid: Middle;
}

contract DeepDefaultsPartial {
  data: Outer;

  init() {
    self.data = Outer{
      mid: Middle{
        leaf: Leaf{
          flag: true
        }
      }
    };
  }
}
