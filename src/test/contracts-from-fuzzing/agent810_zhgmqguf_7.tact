struct MixStruct {
    i: Int;
    s: String?;
    f: Bool;
    addr: Address?;
    c: Cell;
    sl: Slice?;
}

contract TestContract {
    m: MixStruct;
    init() {
        self.m = MixStruct{
            i: 1,
            s: null,
            f: true,
            addr: null,
            c: emptyCell(),
            sl: null,
        };
    }
}