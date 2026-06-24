struct N1 { v1: Int; }
struct N2 { v2: Bool; }
struct Comb {
  one: N1;
  two: N2;
}
contract ManyNestedStructs {
  complex: Comb;

  init() {
    self.complex = Comb{
      one: N1{ v1: 8 },
      two: N2{ v2: false }
    };
  }
}