struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract StorageMix {
    mix: Mix;

    init() {
        self.mix = Mix{
            i: 1,
            b: false,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}