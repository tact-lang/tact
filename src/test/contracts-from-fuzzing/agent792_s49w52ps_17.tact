struct NestedAlles {
    foo: Int;
    bar: Bool;
    cell: Cell;
    addr: Address;
    str: String;
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optAddr: Address?;
    optStr: String?;
}

contract DeepAll {
    data: NestedAlles;

    init() {
        self.data = NestedAlles{
            foo: 1,
            bar: true,
            cell: emptyCell(),
            addr: myAddress(),
            str: "x",
            optInt: null,
            optBool: null,
            optCell: null,
            optAddr: null,
            optStr: null
        };
    }
}