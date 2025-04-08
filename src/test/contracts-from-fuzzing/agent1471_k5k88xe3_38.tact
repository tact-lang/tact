struct AnnotFields {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint4;
}

contract AnnotStructField {
  data: AnnotFields;
  init() {
    self.data = AnnotFields{
      a: 1,
      b: 2,
      c: 3,
    };
  }
}
