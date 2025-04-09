struct SDefault {
  foo: Int = 1;
}

contract OptionalWithDefaults {
    s: SDefault?;

    init() {
        self.s = null;
    }
}