struct Serial {
  x: Int as uint8;
  y: Int as int16;
  z: Int as uint32;
}

contract SerialNested {
  val: Serial = Serial{ x:5, y:-100, z:500 };

  init() {
    self.val = self.val;
  }

  receive() {
    self.val = self.val;
  }
}