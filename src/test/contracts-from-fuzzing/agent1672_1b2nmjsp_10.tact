struct InnerNested {
    ai: Int;
    ab: Bool;
}

struct MidNested {
    mstr: String;
    inner: InnerNested;
}

struct OuterNested {
    addr: Address;
    cell: Cell;
    mid: MidNested;
}

contract TestContract {
    complex: OuterNested;
    init() {
        self.complex = OuterNested{
            addr: myAddress(),
            cell: emptyCell(),
            mid: MidNested{
                mstr: "deeper",
                inner: InnerNested{
                    ai: 555,
                    ab: true
                }
            }
        };
    }
}