struct C {
  valC: Int;
}

struct B {
  maybeC: C?;
}

struct A {
  b: B;
}

contract OptionalNestedInNested {
  root: A = A{
    b: B{}
  };
}