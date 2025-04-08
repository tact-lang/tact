struct Data {
  intField: Int;
  boolField: Bool;
  stringField: String;
  addrField: Address;
}

contract TestContract {
  d: Data;

  init() {
    self.d = Data{
      intField: 42,
      boolField: true,
      stringField: "hello",
      addrField: myAddress(),
    };
  }
}