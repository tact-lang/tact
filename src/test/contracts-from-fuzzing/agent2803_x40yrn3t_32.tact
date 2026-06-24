struct CrazyMix {
    str: String;
    flag: Bool?;
    optNum: Int?;
    addr: Address;
    slice: Slice?;
    cell: Cell;
    optStr: String?;
    optAddr: Address?;
}

contract CrazyMixContract {
    field: CrazyMix;

    init() {
        self.field = CrazyMix{
            str: "hi",
            flag:null,
            optNum:null,
            addr: myAddress(),
            slice:null,
            cell: emptyCell(),
            optStr:null,
            optAddr:null
        };
    }
}