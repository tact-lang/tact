struct Leaf {
  val: Int;
  flag: Bool;
  note: String;
}

struct Middle {
  left: Leaf;
  right: Leaf;
}

struct Root {
  primary: Middle;
  secondary: Middle;
}

contract DeepTree {
  data: Root;

  init() {
    self.data = Root{
      primary: Middle{
        left: Leaf{val:1, flag:true, note:"a"},
        right: Leaf{val:2, flag:false, note:"b"}
      },
      secondary: Middle{
        left: Leaf{val:3, flag:true, note:"c"},
        right: Leaf{val:4, flag:false, note:"d"}
      }
    };
  }
}