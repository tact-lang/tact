struct InnerMost1 { a: Int; }
struct InnerMost2 { b: Bool; }
struct Mid {
  i1: InnerMost1;
  i2: InnerMost2;
}
contract DeepMix {
  m: Mid = Mid {
    i1: InnerMost1{ a: 5 },
    i2: InnerMost2{ b: true }
  };
}
