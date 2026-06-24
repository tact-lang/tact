struct NestedOptional {
  inner: Int?;
  flag: Bool?;
}

struct OuterOptional {
  nested: NestedOptional?;
}

contract TestContract {
  o: OuterOptional;
  init() {
    self.o = OuterOptional{nested: null};
  }
}