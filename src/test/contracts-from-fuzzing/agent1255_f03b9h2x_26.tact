struct Inner {
    foo: Int;
    rem: Slice as remaining;
}

contract Test26 {
    data: Inner?;

    init() {
        self.data = null;
    }
}