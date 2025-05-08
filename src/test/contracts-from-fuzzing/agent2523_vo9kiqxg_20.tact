// Optional of Struct with Optional fields
struct Inner {
  a: Int?;
  b: String?;
}

contract OptStructField {
  optStruct: Inner?;
  init() {
    self.optStruct = null;
  }
}
