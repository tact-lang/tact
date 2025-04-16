struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Params {
  name: String = "Satoshi";
  age: Int?;
  p: Point;
}

contract DefaultVals {
  data: Params;

  init() {
    self.data = Params{
      p: Point{
        x: 1,
        y: 2
      }
    };
  }
}