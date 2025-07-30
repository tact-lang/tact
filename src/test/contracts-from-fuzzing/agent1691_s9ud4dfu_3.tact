struct OptionalNested {
    foo: Int?;
    bar: Bar?;
}

struct Bar {
    x: Int;
    y: Int;
}

contract OptionalNestedTest {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            foo: null,
            bar: null
        };
    }
}