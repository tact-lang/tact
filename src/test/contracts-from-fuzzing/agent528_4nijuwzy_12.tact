struct OptionalNestedDefault {
  a: Int?;
  b: Bool?;
}

contract OptionalStructPersistent {
    s: OptionalNestedDefault;
    init() {
        self.s = OptionalNestedDefault{};
    }
}
