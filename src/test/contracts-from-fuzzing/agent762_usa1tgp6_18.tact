struct NestedMany {
  i1: Int;
  s1: String;
  f: Bool;
  addr: Address;
}

struct ContainMany {
  m: NestedMany;
  again: NestedMany;
}

contract ManyNestedStructs {
  top: ContainMany;

  init() {
    self.top = ContainMany{
      m: NestedMany{ i1: 1, s1: "a", f: true, addr: myAddress() },
      again: NestedMany{ i1: 2, s1: "b", f: false, addr: myAddress() }
    };
  }
}