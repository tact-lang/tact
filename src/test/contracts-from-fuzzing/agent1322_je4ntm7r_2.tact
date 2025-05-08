struct OptionalNested {
    maybe: Inner?;
}

struct Inner {
    val: Int;
}

contract TestOptional {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ maybe: Inner{ val: 42 } };
    }
}