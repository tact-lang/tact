struct OptionalHolder {
  x: Int?;
  y: Bool?;
}

contract TestOptional {
  holder: OptionalHolder;

  init() {
    self.holder = OptionalHolder{x: null, y: true};
  }
}