struct Reordered {
    a: Int;
    c: Int;
    b: Slice as remaining;
}

contract RemainingLastOk {
    s: Reordered;

    init() {
        self.s = Reordered{
            a:1,
            c:2,
            b:emptyCell().asSlice()
        };
    }
}