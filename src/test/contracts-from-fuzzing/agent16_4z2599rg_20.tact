// Contract field with defaulted struct containing optional
struct Point {
  x: Int;
  y: Int?;
}

contract Test {
  data: Point = Point{x:10,y:null};

  init() {}
}