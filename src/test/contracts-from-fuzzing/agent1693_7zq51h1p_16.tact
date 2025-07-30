struct OptionalInt {
  x: Int?;
}

struct OptionalBool {
  y: Bool?;
}

struct OptionalString {
  z: String?;
}

contract ManyOptionalStructs {
  a: OptionalInt;
  b: OptionalBool;
  c: OptionalString;

  init() {
    self.a = OptionalInt{ x: null };
    self.b = OptionalBool{ y: null };
    self.c = OptionalString{ z: null };
  }
}