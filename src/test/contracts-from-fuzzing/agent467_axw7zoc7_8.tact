struct OptionalNested {
    opt1: Inner?;
    opt2: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            opt1: Inner{ value: 1 },
            opt2: null,
        };
    }
}