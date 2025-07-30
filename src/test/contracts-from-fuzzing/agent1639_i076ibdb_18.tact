struct AddrsCells {
    a1: Address;
    a2: Address?;
    a3: Address?;
    c1: Cell;
    c2: Cell?;
    c3: Cell?;
}

contract TestContract {
    data: AddrsCells;

    init() {
        self.data = AddrsCells{
            a1: myAddress(),
            a2: null,
            a3: myAddress(),
            c1: emptyCell(),
            c2: null,
            c3: emptyCell()
        };
    }
}