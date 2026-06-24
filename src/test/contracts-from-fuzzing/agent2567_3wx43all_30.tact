struct CustomSerialize {
  x: Int as uint64;
  y: Int as int32;
  z: Int as uint5;
}

contract CustomSerializeStorage {
  s: CustomSerialize;
  init() {
    self.s = CustomSerialize{x:1,y:-1,z:3};
  }
}