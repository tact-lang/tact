struct Point {
  x: Int as int16;
  y: Int as int16;
}

struct ComplexStruct {
  id: Int as uint32;
  flag: Bool;
  description: String;
  position: Point;
  optPosition: Point?;
  enabled: Bool?;
  comment: String;
}

contract ComplexStorage {
  data: ComplexStruct;

  init() {
    self.data = ComplexStruct{
      id: 10,
      flag: true,
      description: "desc",
      position: Point{x: 1, y: 2},
      optPosition: null,
      enabled: false,
      comment: "ok",
    };
  }
}