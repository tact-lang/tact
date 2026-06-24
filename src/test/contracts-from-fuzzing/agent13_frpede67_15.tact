// test inheritance of large storage structs via trait
trait SuperTrait {
  sa: Int;
  sb: Bool;
}

contract Inheritor with SuperTrait {
  sa: Int;
  sb: Bool;

  init() {
    self.sa = 123;
    self.sb = true;
  }
}