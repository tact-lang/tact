struct S1 {
  int1: Int as int8;
  int2: Int as uint8;
  int3: Int as int16;
  int4: Int as uint16;
  int5: Int as int32;
  int6: Int as uint32;
}

contract IntSerializationTest {
  packed: S1;

  init() {
    self.packed = S1 {
      int1: -10,
      int2: 250,
      int3: -30000,
      int4: 60000,
      int5: -1000000000,
      int6: 4000000000
    };
  }
}