struct S1 {
    val: Int;
    rest: Slice as remaining;
}

struct S2 {
    nested: S1;
    more: Int;
}

contract NestedRemainingSliceTest {
    s: S2;

    init() {
        self.s = S2{
            nested: S1{ val: 10, rest: emptyCell().asSlice() },
            more: 20
        };
    }
}