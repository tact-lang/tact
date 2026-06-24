struct Line {
  from_x: Int;
  from_y: Int;
  to_x: Int;
  to_y: Int;
}

struct Rectangle {
  top_left: Line;
  bottom_right: Line;
}

struct Box {
  outer: Rectangle;
  inner: Rectangle;
}

contract Geometry {
  shape: Box;

  init() {
    self.shape = Box{
      outer: Rectangle{
        top_left: Line{ from_x:0, from_y:0, to_x:1, to_y:1 },
        bottom_right: Line{ from_x:1, from_y:1, to_x:2, to_y:2 },
      },
      inner: Rectangle{
        top_left: Line{ from_x:3, from_y:3, to_x:4, to_y:4 },
        bottom_right: Line{ from_x:4, from_y:4, to_x:5, to_y:5 },
      }
    };
  }
}