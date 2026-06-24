struct Point {
  x: Int;
  y: Int;
}

struct ColoredPoint {
  point: Point;
  color: String;
}

contract Coord {
  pos1: ColoredPoint = ColoredPoint{
    point: Point{ x: 1, y: 2 },
    color: "red"
  };
  pos2: ColoredPoint = ColoredPoint{
    point: Point{ x: 3, y: 4 },
    color: "green"
  };
}