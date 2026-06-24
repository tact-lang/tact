// struct with only default-null optionals
struct AllNulls {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Cell? = null;
  e: Slice? = null;
  f: Builder? = null;
  g: Address? = null;
}

contract AllNullsCont {
  x: AllNulls;

  init() {
    self.x = AllNulls{};
  }
}