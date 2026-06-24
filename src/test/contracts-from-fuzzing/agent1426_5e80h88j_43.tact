// Nested optionals holding addresses and cells
struct OptionAddrCell {
    a: Address?;
    c: Cell?;
}

struct OuterOpt {
    inner1: OptionAddrCell?;
    inner2: OptionAddrCell?;
}

contract OptAddrCellContract {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            inner1: null,
            inner2: OptionAddrCell { a: null, c: emptyCell() }
        };
    }
}