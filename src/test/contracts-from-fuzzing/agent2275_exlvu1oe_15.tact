struct OptionalWithDefault {
  s: String? = null;
  i: Int? = null;
}

contract DefaultOptional {
  o: OptionalWithDefault;
  init() {
    self.o = OptionalWithDefault{};
  }
}