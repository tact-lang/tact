struct Composed {
  address: Address;
  optInt: Int?;
  optStr: String?;
  num: Int as uint32;
  flag: Bool;
}

contract TestContract {
  data: Composed;

  init() {
    self.data = Composed{
      address: myAddress(),
      optInt: null,
      optStr: "hello",
      num: 123,
      flag: true
    };
  }
}