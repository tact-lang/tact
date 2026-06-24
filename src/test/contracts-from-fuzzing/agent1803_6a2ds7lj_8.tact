struct OptionalInt {
    foo: Int?;
}

contract OptIntContract {
    f: OptionalInt;

    init() {
        self.f = OptionalInt {
            foo: 123
        };
    }
}