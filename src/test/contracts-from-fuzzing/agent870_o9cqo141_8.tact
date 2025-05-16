struct SerStruct {
  u8: Int as uint8;
  i16: Int as int16;
  u32: Int as uint32;
  i64: Int as int64;
  posCoins: Int as coins;
}

contract StructSerializationTest {
    data: SerStruct;

    init() {
        self.data = SerStruct{
          u8: 1,
          i16: -2,
          u32: 3,
          i64: -4,
          posCoins: 1000000
        };
    }
}