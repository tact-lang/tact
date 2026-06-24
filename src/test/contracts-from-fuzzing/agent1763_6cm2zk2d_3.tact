struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{nested: null};
    }
}