struct WeirdOrder {
    b: Bool;
    i: Int;
    s: String;
    optB: Bool?;
    optI: Int?;
    optS: String?;
    c: Cell;
    sl: Slice;
}

contract FieldOrderEdge {
    f: WeirdOrder;

    init() {
        self.f = WeirdOrder{
            b: false,
            i: 0,
            s: "",
            optB: null,
            optI: null,
            optS: null,
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}