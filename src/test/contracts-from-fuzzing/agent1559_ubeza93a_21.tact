struct MostTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optC: Cell?;
    optAddr: Address?;
}

contract FullTypeMix {
    all: MostTypes;

    init() {
        self.all = MostTypes{
            i: 1,
            b: true,
            s: "str",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            optI: null,
            optB: null,
            optS: null,
            optC: null,
            optAddr: null,
        };
    }
}