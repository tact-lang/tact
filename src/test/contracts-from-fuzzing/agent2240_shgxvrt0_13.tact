struct Wrapper {
  value: Int;
}

contract OptionalNestedInPersistent {
    field: Wrapper?;

    init() {
        self.field = Wrapper{ value: 999 };
    }
}