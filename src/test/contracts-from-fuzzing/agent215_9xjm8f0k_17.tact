struct A {
  x: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

contract OptionOuter {
  maybeC: C? = null;
}