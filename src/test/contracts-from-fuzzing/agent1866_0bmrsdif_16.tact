struct OptionalDeep {
    foo: Int;
    bar: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
    str: String?;
}

contract OptionalDeepTest {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            foo: 123,
            bar: null,
        };
    }
}