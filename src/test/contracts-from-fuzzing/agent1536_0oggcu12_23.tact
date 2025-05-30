// Deeply nested optional chain with several optionals on inner levels
struct L3 {
  a: Int?;
  b: Bool?;
}

struct L2 {
  c: Int?;
  nestL3: L3?;
}

struct L1 {
  d: Bool?;
  nestL2: L2;
}

contract MultiOptionalNested {
  store: L1;

  init() {
    self.store = L1{
      d: null,
      nestL2: L2{
        c: null,
        nestL3: L3{ a:null, b:null }
      }
    };
  }
}