struct OptionalStringHolder {
  s: String?;
}

contract OptionalStrings {
  o1: OptionalStringHolder;
  o2: OptionalStringHolder;

  init() {
    self.o1 = OptionalStringHolder{ s: null };
    self.o2 = OptionalStringHolder{ s: null };
  }
}