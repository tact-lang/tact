struct MultiType {
  x: Int as uint32;
  y: Int as int16;
  z: Int;
  b: Bool;
  s: String;
}

contract MultiTypeFields {
  data: MultiType = MultiType{ x:5, y:-7, z:1000, b:true, s:"abc" };
  init() {
    self.data = MultiType{ x:6, y:-8, z:2000, b:false, s:"def" };
  }
  receive() {}
}