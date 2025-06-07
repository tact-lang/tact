struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    nestedOpt: OptionalNested;

    init() {
        self.nestedOpt = OptionalNested {
            inner: Inner { val: 42 }
        };
    }
}
