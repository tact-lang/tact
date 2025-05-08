struct CellOpt {
    c: Cell?;
    s: Slice?;
}

struct AddrOpt {
    a: Address?;
}

struct Wrapper {
    cellOpt: CellOpt?;
    addrOpt: AddrOpt?;
}

contract Test {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            cellOpt: null,
            addrOpt: null
        };
    }
}