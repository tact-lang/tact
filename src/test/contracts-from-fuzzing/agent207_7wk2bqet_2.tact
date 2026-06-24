struct NestedA {
    i: Int;
    b: Bool;
}

struct NestedB {
    addr: Address;
    cellData: Cell;
    nested: NestedA;
}

contract Test2 {
    data: NestedB;
    init() {
        self.data = NestedB{
            addr: myAddress(),
            cellData: emptyCell(),
            nested: NestedA{
                i: 7,
                b: true
            }
        };
    }
}