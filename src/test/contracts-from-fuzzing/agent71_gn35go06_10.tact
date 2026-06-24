struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{inner: null};
    }
}