struct OptionalStructs {
    inner1: Inner?;
    inner2: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            inner1: null,
            inner2: null,
        };
    }
}