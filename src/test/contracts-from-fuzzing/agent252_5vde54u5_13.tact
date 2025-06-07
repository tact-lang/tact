struct OptStruct {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract OptFields {
  val: OptStruct;

  init() {
    self.val = OptStruct{
      a: null,
      b: null,
      c: null
    };
  }
}