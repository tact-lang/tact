// optional with uint8 serialization for signed negative value
contract OptUint8Range {
  y: Int? as uint8;

  init() {
    self.y = -7; // this is out of range, but no compile error
  }
}
