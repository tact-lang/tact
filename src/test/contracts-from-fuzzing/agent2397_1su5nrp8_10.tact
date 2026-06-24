struct OptionalWithDefaults {
  a: Int? = null;
  b: Bool? = false;
  c: String? = null;
  d: Address? = null;
}

contract ComplexOptionals {
  state: OptionalWithDefaults = OptionalWithDefaults{};
  receive() {}
}