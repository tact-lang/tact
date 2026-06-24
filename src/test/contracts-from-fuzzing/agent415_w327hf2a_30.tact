struct Inner {
    prefix: Int;
    rem: Slice as remaining;
}

contract OptionalRem {
    field: Inner?;

    init() {
        self.field = null;
    }
}