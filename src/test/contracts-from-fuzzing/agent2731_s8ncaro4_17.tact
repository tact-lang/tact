struct Payload {
  text: String;
  number: Int;
}

contract MultiAssign {
  data: Payload;

  init() {
    self.data = Payload{text: "hello", number: 5};
    self.data = Payload{text: "bye", number: 10};
  }
}