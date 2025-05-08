struct Defaulted {
    a: Int = 0;
    b: Bool = false;
}

contract InitOnlyOverride {
    foo: Defaulted;

    init() {
        self.foo = Defaulted{ a: 99, b: true };
    }
}