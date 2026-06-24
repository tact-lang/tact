struct Remain {
    prefix: Int;
    suf: Slice as remaining;
}

contract RemainTest {
    s: Remain;

    init() {
        self.s = Remain{
            prefix: 7,
            suf: emptyCell().asSlice()
        };
    }
}