// Many optionals in nested structs
struct Nested1 { a: Int?; b: Bool?; }
struct Nested2 { c: String?; d: Slice?; }
struct Combined {
  n1: Nested1;
  n2: Nested2;
}

contract TestContract {
  store: Combined;

  init() {
    self.store = Combined{
      n1: Nested1{ a:null, b:null },
      n2: Nested2{ c:null, d:null }
    };
  }
}