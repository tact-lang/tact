struct Leaf {
  a: Int?;
  b: Bool = true;
}

struct Branch {
  leaf: Leaf?;
  val: Int = 5;
}

contract TestContract {
    top: Branch;

    init() {
        self.top = Branch{
            leaf: Leaf{a: null},
            val: 42
        };
    }
}