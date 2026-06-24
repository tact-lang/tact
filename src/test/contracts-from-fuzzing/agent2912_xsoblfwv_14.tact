struct ManyNestedOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
}

struct Container {
  inner: ManyNestedOptional?;
}

contract OptNested {
  c: Container;
  init() {
    self.c = Container{ inner: null };
  }
}