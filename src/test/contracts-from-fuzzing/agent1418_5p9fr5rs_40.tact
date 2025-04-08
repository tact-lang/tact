struct LastAsRemaining {
    x: Int;
    y: Slice as remaining;
}

struct MidRem {
    prefix: Int;
    mid: LastAsRemaining;
}

contract NestedRemainingInMiddle {
    val: MidRem;

    init() {
        self.val = MidRem {
            prefix: 2,
            mid: LastAsRemaining{ x:3, y: emptyCell().asSlice() }
        };
    }
}