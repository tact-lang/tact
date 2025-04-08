// Struct with very long string as default initializer
struct LongStringField {
  s: String = "This is a long string with many characters! 0123456789 abcdefghijklmnopqrstuvwxyz";
}

contract LongStringDefault {
  data: LongStringField;

  init() {
    self.data = LongStringField{};
  }
}
