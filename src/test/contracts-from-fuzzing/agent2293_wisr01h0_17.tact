struct OptionalStringWrap {
  s: String?;
}

contract OptionalField {
  w: OptionalStringWrap = OptionalStringWrap{ s: null };
}