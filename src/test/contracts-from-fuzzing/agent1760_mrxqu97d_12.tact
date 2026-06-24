struct OptionalStringHolder {
  s: String?;
}

contract OptString {
  str: OptionalStringHolder;

  init() {
    self.str = OptionalStringHolder{
      s: null
    };
  }
}