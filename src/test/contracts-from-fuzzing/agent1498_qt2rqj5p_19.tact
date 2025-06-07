struct CompositeMixed {
    count: Int;
    flag: Bool;
    addr: Address;
    s: Slice;
    text: String;
    cell: Cell;
    optNum: Int?;
    optText: String?;
}

contract TestContract {
    multi: CompositeMixed;

    init() {
        self.multi = CompositeMixed{
            count: 5,
            flag: true,
            addr: myAddress(),
            s: emptyCell().asSlice(),
            text: "Hi",
            cell: emptyCell(),
            optNum: null,
            optText: null
        };
    }
}
