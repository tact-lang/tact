struct Leaf {
  x: Int? = null;
  y: Bool = false;
}

struct Mid {
  left: Leaf?;
  right: Leaf?;
  name: String = "m";
}

struct Top {
  primary: Mid?;
  secondary: Mid;
  remark: String = "top";
}

contract DeepTree {
  root: Top;

  init() {
    self.root = Top{
      primary: null,
      secondary: Mid{
        left: Leaf{ x: 1, y: true },
        right: null,
        name: "sec",
      },
      remark: "ready",
    };
  }

  receive() { dump(self.root.remark); }
}
