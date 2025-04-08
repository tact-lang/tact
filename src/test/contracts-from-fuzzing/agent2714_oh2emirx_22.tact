struct Remain {
    a: Int;
    payload: Slice as remaining;
}

contract Test22 {
    r: Remain;

    init() {
        self.r = Remain{ a: 42, payload: emptyCell().asSlice() };
    }
}