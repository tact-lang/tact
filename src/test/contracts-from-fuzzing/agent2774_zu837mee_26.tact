// persistent optional struct
struct OptionalStruct {
  n: Int?;
  flag: Bool?;
}

contract TestContract {
  val: OptionalStruct?;

  init() {
    self.val = OptionalStruct{
      n: 42,
      flag: null
    };
  }
}