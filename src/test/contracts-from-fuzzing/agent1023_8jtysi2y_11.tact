// Test combination of nested structs, optional fields, explicit serialization
struct InnerOpt {
  a: Int?;
  b: Bool?;
}

struct Middle {
  x: Int as uint32;
  y: InnerOpt;
  z: String;
}

contract Combo {
  data: Middle;

  init() {
    self.data = Middle{
      x: 12345,
      y: InnerOpt{
        a: null,
        b: true
      },
      z: "combo"
    };
  }
}
