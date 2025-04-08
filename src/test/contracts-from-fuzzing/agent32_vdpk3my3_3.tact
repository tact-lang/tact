struct Leaf {
  data: Int?;
  flag: Bool?;
}

struct Branch {
  leaf: Leaf?;
  value: Int;
}

contract OptionalNestStorage {
  branchField: Branch = Branch{
    leaf: null,
    value: 17
  };

  receive() {}
}