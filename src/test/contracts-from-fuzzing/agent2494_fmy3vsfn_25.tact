struct A {
  val: Int;
}

struct B {
  aval: A;
}

struct C {
  bval: B;
}

contract DeepChain {
  chain: C = C{bval: B{aval: A{val: 100}}};
}