struct SerializationShifts {
  a: Int as uint32;
  b: Int as int16;
  c: Int as uint8;
}

contract SerializedFields {
  data: SerializationShifts;

  init() {
    self.data = SerializationShifts{
      a:1000,b:-123,c:255
    };
  }
}