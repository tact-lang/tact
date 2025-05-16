contract OptionalStruct {
  optionalStruct: Data?;

  init() {
    self.optionalStruct = Data{
      a: 1,
      b: true,
    };
  }
}

struct Data {
  a: Int;
  b: Bool;
}
