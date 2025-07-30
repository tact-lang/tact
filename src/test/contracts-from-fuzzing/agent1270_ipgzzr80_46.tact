trait Tr {
  x: Int;
}
trait Tb {
  y: Bool;
}

contract Combined with Tr, Tb {
  x: Int;
  y: Bool;

  init() {
    self.x = 5;
    self.y = false;
  }
}