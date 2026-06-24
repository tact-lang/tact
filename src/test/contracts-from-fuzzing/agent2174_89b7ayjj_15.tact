struct Exotic {
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    flag: Bool;
}

contract ExoticContract {
    store: Exotic;
    init() {
        self.store = Exotic{
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            flag: true
        };
    }
}
