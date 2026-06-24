struct Inner {
    prefix: Int;
    rem: Slice as remaining;
}

contract AssignedRem {
    field: Inner;

    init() {
        self.field = Inner{ prefix:42, rem:emptyCell().asSlice() };
    }
}