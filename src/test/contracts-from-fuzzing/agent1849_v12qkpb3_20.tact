struct NestedDefaultsOptionals {
  flag: Bool?;
  inner: InnerNested?;
}

struct InnerNested {
  val: Int = 10;
}

contract OptionalDefaultsComplex {
  data: NestedDefaultsOptionals;

  init() {
    self.data = NestedDefaultsOptionals{ flag: null, inner: null };
  }
}