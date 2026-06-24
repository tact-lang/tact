struct SlicesBundle {
    s1: Slice?;
    s2: Slice?;
    data: Slice as remaining;
}

contract TestContract {
    bundle: SlicesBundle;

    init() {
        self.bundle = SlicesBundle{
            s1: null,
            s2: null,
            data: emptyCell().asSlice()
        };
    }
}