struct A {
  fieldA: Int;
}

struct B {
  fieldB: String;
}

contract CrossNested {
  nestedA: A;
  nestedB: B;

  init() {
    self.nestedA = A{ fieldA:5 };
    self.nestedB = B{ fieldB: "yes" };
  }
}
