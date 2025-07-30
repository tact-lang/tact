struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            inner: null
        };
    }
}