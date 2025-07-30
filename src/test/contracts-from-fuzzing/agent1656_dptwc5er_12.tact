struct OptionalStructs {
    foo: Int;
    bar: Minimal?;
}

struct Minimal {
    x: Bool;
    y: Int;
}

contract OptionalStructsTest {
    storage: OptionalStructs;

    init() {
        self.storage = OptionalStructs{
            foo: 1,
            bar: Minimal{
                x: true,
                y: 456
            },
        };
    }
}
