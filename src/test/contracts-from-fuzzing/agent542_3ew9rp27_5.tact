struct OptionalNested {
    innerOpt: Inner?;
    number: Int;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerOpt: Inner{ foo: 11, bar: null },
            number: 42
        };
    }
}