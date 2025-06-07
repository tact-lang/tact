struct NestedSerialization {
    inner: InnerSerialized;
}

struct InnerSerialized {
    a: Int as uint8;
    b: Bool;
}

contract TestContract {
    data: NestedSerialization;

    init() {
        self.data = NestedSerialization{
            inner: InnerSerialized{a:255, b:true},
        };
    }
}