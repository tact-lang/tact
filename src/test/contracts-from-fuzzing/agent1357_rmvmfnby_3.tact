struct InnerMost {
  flag: Bool?;
  num: Int?;
}

struct Middle {
  nested: InnerMost;
}

struct Outer {
  mid: Middle;
}

contract Test {
  myField: Outer = Outer{
    mid: Middle{
      nested: InnerMost{
        flag: null,
        num: null,
      }
    }
  };

  init() {
    self.myField = Outer{
      mid: Middle{
        nested: InnerMost{
          flag: null,
          num: null,
        }
      }
    };
  }
}