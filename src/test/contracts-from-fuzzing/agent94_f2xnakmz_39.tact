struct HasBool {
  x: Bool;
  y: Bool;
  z: Bool;
}

contract MultiBool {
  data: HasBool;

  init() {
    self.data = HasBool{ x: true, y: false, z: true };
  }
}