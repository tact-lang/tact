// Nested struct with defaulted optional fields
struct Leaf {
  data: Int?;
}

struct Branch {
  leaf: Leaf;
  mark: Bool?;
}

contract TestContract {
  root: Branch;

  init() {
    self.root = Branch{
      leaf: Leaf{ data: null },
      mark: true
    };
  }
}