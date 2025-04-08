// Test multiple 'remaining' fields in nested structs

struct InnerRem {
    part: Slice as remaining;
}

struct OuterRem {
    prefix: Int;
    inner: InnerRem;
    suffix: Slice as remaining;
}

contract Test {
    st: OuterRem;

    init() {
        self.st = OuterRem{
            prefix: 1,
            inner: InnerRem{ part: emptyCell().asSlice() },
            suffix: emptyCell().asSlice(),
        };
    }
}