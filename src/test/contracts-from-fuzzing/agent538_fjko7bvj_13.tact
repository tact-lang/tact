struct Point { x: Int; y: Int; }

struct Rectangle { p1: Point; p2: Point; }

struct Box { r1: Rectangle; r2: Rectangle; }

contract NestedStructs {
  box: Box;
  init() {
    self.box = Box{
      r1: Rectangle{
        p1: Point{ x: 1, y: 2 },
        p2: Point{ x: 3, y: 4 }
      },
      r2: Rectangle{
        p1: Point{ x: 5, y: 6 },
        p2: Point{ x: 7, y: 8 }
      }
    };
  }
}