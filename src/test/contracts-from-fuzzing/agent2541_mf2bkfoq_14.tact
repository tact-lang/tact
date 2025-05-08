struct Payload {
    txt: String;
    addr: Address;
    slice: Slice;
    cell: Cell;
    flag: Bool;
    n: Int;
}

contract FullStruct {
    data: Payload;

    init() {
        self.data = Payload{
            txt: "hi",
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            flag: true,
            n: 42
        };
    }
}