struct Leaf {
  val: Int = 3;
  note: String?;       // implicit null
}

struct Mid {
  leaf: Leaf?;
  flag: Bool? = null;
}

struct Root {
  node: Mid?;
  title: String = "root";
}

contract TestContract {
  data: Root;

  init() {
    self.data = Root{
      node: null,
      title: "start"
    };
  }
}