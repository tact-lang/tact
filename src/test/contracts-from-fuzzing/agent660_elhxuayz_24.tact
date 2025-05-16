struct SerIntSigned {
  pos: Int as int32;
  neg: Int as int32;
}

contract SignedIntSerializationTest {
  data: SerIntSigned;

  init() {
    self.data = SerIntSigned{
      pos: 2147483647, // max 32-bit
      neg: -2147483648, // min 32-bit
    };
  }
}