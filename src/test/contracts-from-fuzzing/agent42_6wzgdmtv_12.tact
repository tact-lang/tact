struct OptionalStruct {
  f1: Bool?;
  f2: Int?;
  f3: String?;
  f4: Bool?;
  f5: Int?;
}

contract TestContract {
  val: OptionalStruct;

  init() {
    self.val = OptionalStruct{
      f1: null,
      f2: null,
      f3: null,
      f4: null,
      f5: null
    };
  }
}