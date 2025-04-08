struct OptionalOver {
  x: Int? as uint4;
}

contract OptionalSerializationOverflow {
  data: OptionalOver;
  init() {
    self.data = OptionalOver{ x: 44 }; // overflow for uint4 = 0..15
  }
}
