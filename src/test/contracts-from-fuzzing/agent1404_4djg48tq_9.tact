struct OptionalNested {
    nested1: Int?;
    nested2: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested1: null,
            nested2: null
        };
    }
}