// nested struct having optional string, int, and bool with defaults
struct Nested {
  s: String? = null;
  i: Int? = null;
  b: Bool? = null;
}

contract TestContract {
  x: Nested;

  init() {
    self.x = Nested{};
  }
}