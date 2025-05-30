struct NestedRem {
    val: Int;
    rem: Slice as remaining;
}

struct OuterRem {
    a: NestedRem;
    b: Slice as remaining;
}

contract DoubleRemainingTest {
    f: OuterRem;

    init() {
        self.f = OuterRem{
            a: NestedRem{ val:42, rem: emptyCell().asSlice() },
            b: emptyCell().asSlice()
        };
    }
}