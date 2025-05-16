// structs with many optional fields with default values omitted
struct S {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Address?;
  e: String?;
  f: Cell?;
  g: Slice?;
}

contract TestContract {
  data: S;

  init() {
    self.data = S{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null
    };
  }
}