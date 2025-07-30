struct A {
  a: Int?;
}

struct B {
  b: Int?;
}

struct AB {
  f: A;
  g: B?;
}

contract MixedOptInOpts {
  s: AB?;

  init() {
    self.s = null;
  }
}