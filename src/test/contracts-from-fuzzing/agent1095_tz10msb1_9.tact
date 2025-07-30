struct NestedA {
  aa: Int?;
}

struct NestedB {
  bb: Bool?;
}

struct Outer {
  f1: NestedA?;
  f2: NestedB?;
  f3: Int;
}

contract OptionalNesting {
    store: Outer;

    init() {
        self.store = Outer{
            f1: null,
            f2: NestedB{ bb: null },
            f3: 42
        };
    }
}