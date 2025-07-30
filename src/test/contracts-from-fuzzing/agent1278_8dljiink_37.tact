message(12345) Pack {
    id: Int;
    data: Slice as remaining;
}

contract TestContract {
    pack: Pack;

    init() {
        let s = emptyCell().asSlice();
        self.pack = Pack{
            id: 55,
            data: s,
        };
    }
}