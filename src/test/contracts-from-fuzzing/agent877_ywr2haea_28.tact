// Deeply nested optionals and complex struct
struct L3 {
  value: Int?;
  flag: Bool?;
}

struct L2 {
  nested: L3?;
}

struct L1 {
  nested: L2?;
}

contract BigOptionalNesting {
  data: L1?;

  init() {
    self.data = L1{
      nested: L2{
        nested: null,
      },
    };
  }
}