struct OptionalBoolDefault {
    a: Bool?;
    b: Bool = true;
    c: Bool?;
}

contract OptBoolDefaultTest {
    s: OptionalBoolDefault;

    init() {
        self.s = OptionalBoolDefault{
            a: null,
            c: null,
        };
    }
}