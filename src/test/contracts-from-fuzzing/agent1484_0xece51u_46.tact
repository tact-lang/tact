struct NestedDefaultNullable {
  foo: Int? = null;
}

struct Embedded {
  nest: NestedDefaultNullable;
}

contract UsesDefaultsInNested {
  val: Embedded;

  init() {
    self.val = Embedded{ nest: NestedDefaultNullable{} };
  }
}