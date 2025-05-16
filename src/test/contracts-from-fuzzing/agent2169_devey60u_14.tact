struct InnerSet {
 x: Int = 1;
 y: Int?;
}

struct OuterSet {
 a: InnerSet = InnerSet{};
}

contract DefaultsNested {
  nested: OuterSet;

  init() {
    self.nested = OuterSet{};
  }
}