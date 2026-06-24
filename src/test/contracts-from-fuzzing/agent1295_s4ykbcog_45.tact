// deeply nested mixed primitives, structs, optionals, serialization
struct L3 {
  a: Int as uint8;
  b: Bool?;
}

struct L2 {
  nest: L3?;
  s: String?;
}

struct L1 {
  inner: L2?;
}

contract HugeNested {
  field: L1?;

  init() {
    self.field = L1{
      inner: L2{
        nest: L3{
          a: 123,
          b: true
        },
        s: "nested"
      }
    };
  }
}