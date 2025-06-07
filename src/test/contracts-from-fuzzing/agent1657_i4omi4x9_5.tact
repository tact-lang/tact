struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract Test {
    maybe: OptionalNest;

    init() {
        self.maybe = OptionalNest{ inner: null };
    }
}