struct Leaf {
  f1: Bool;
  f2: Int = 42;
}

struct Branch {
  leaf: Leaf?;
  note: String?;
}

contract OptNestedStruct {
  state: Branch = Branch{leaf: null, note: null};
}