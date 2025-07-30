struct Inner {
    foo: Int? as uint8;
}

contract NestedOptSerialized {
    data: Inner?;

    init() {
        self.data = null;
    }
}