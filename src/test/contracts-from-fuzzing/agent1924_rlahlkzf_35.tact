struct OptionalInner {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            nested: null
        };
    }
}