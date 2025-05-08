struct WithSlice {
    sl: Slice;
}

contract HasStructWithSlice {
    dat: WithSlice;

    init() {
        self.dat = WithSlice{
            sl: emptyCell().asSlice(),
        };
    }
}