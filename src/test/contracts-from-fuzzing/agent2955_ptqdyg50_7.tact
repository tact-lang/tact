struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract DeepOptional {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: null };
    }
}
