struct DeepNested {
  a: Int;
  b: OptionalLevel1;
}

struct OptionalLevel1 {
  x: Bool?;
  y: OptionalLevel2?;
}

struct OptionalLevel2 {
  foo: Int?;
  bar: Point?;
}

struct Point {
  x: Int;
  y: Int;
}

contract TestDeepNested {
  storage: DeepNested;
  
  init() {
    self.storage = DeepNested{
      a: 1,
      b: OptionalLevel1{
        x: true,
        y: OptionalLevel2{
          foo: 42,
          bar: Point{x: 3, y: 4}
        }
      }
    };
  }
}
