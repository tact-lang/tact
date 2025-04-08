struct NestedA {
  i: Int;
}

struct NestedB {
  j: Int;
}

struct WithNested {
   a: NestedA;
   b: NestedB;
}

struct TopLevel {
  inner: WithNested;
  str: String?;
  addr: Address;
}

contract ComboNested {
  data: TopLevel;

  init() {
    self.data = TopLevel{
      inner: WithNested{
        a: NestedA{i:1},
        b: NestedB{j:2}
      },
      str: null,
      addr: myAddress()
    };
  }
}