struct Point {
  x: Int;
  y: Int;
}

struct Container {
  data: Point?;
}

contract Setter {
  c: Container;

  init() {
    self.c = Container{data: null};
  }
  
  receive() {
    self.c = Container{data: Point{x:5,y:7}};
  }
}
