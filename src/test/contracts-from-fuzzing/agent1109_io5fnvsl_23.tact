struct OptionalStruct {
  a: Int;
  b: Int?;
}

contract OptionalInStorage {
  s: OptionalStruct?;
  init() {
    self.s = OptionalStruct{
      a: 1,
      b: null,
    };
  }
}