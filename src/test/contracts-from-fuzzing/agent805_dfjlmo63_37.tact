struct MixDefaultsSerialization {
  a: Int = 4;
  b: Int as uint8;
  c: Int? as uint16;
}

contract MixDefaultsSer {
  data: MixDefaultsSerialization;

  init() {
    self.data = MixDefaultsSerialization{ b:5, c:null };
  }
}
