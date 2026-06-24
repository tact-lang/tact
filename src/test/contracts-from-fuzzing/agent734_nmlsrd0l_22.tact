struct OptionalBooleans {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract OptionalBoolStructTest {
    data: OptionalBooleans;

    init() {
        self.data = OptionalBooleans{
            a: null,
            b: true,
            c: null,
        };
    }
}
