struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Metadata {
  name: String;
  age: Int?;
  addr: Address?;
}

struct Complex {
  p: Point;
  meta: Metadata;
  flag: Bool;
}

contract MixedFields {
  data: Complex;

  init() {
    self.data = Complex{
      p: Point{ x: 0, y: 0 },
      meta: Metadata { name: "name", age: null, addr: null },
      flag: false
    };
  }
}