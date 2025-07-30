struct ContainsNested {
  sub: Sub;
}

struct Sub {
 foo: Int;
 bar: Bool;
}

contract TestContainsNested {
  storage: ContainsNested;

  init() {
    self.storage = ContainsNested{
      sub: Sub{ foo: 5, bar: true }
    };
  }
}
