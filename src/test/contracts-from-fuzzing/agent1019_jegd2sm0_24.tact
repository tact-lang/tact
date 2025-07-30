struct Multi {
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
}

contract TestContract {
    m: Multi;

    init() {
        self.m = Multi{
            s: "hello",
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}