struct BigNested {
    i1: Int;
    s1: String;
    opt1: Int?;
    s2: String;
    flag1: Bool;
    addr1: Address;
    cell1: Cell;
    flag2: Bool?;
    addr2: Address?;
    cell2: Cell?;
    strOpt: String?;
}

contract Test {
    bigOne: BigNested;

    init() {
        self.bigOne = BigNested{
            i1: 1,
            s1: "hi",
            opt1: null,
            s2: "world",
            flag1: true,
            addr1: myAddress(),
            cell1: emptyCell(),
            flag2: null,
            addr2: null,
            cell2: null,
            strOpt: null,
        };
    }
}