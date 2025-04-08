struct OptionalLevels {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OptionalStorage {
    foo: OptionalLevels;

    init() {
        self.foo = OptionalLevels{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }

    receive() {
        let _ = self.foo;
    }
}