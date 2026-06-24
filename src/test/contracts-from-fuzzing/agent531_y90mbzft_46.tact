struct WithSlice {
    s: Slice;
}

contract StructWithSlice {
    dat: WithSlice;

    init() {
        self.dat = WithSlice{
            s: emptyCell().asSlice()
        };
    }
}