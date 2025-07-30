struct VariantA {
  v: Int;
}

struct VariantB {
  v: String;
}

contract ManyVariants {
  a: VariantA;
  b: VariantB;

  init() {
    self.a = VariantA{v:100};
    self.b = VariantB{v:"hello"};
  }
}