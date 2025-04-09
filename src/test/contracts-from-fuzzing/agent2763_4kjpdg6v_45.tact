struct Fields {
  f1: Int;
  f2: Bool;
  f3: Address;
  f4: String;
}

contract VariousFields {
  data: Fields;
  init() {
    self.data = Fields{
      f1: 1,
      f2: true,
      f3: myAddress(),
      f4: "field"
    };
  }
}