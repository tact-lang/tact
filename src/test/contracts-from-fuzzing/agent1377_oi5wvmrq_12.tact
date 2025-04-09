struct Packed {
  x: Int as uint8;
  y: Int as int16;
  flag: Bool;
}

contract TestContract {
  info: Packed;

  init() {
    self.info = Packed{
      x:255,
      y:-123,
      flag:true
    };
  }
}