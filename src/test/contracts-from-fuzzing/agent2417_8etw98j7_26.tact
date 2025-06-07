struct RefStruct {
    addr: Address;
    content: Cell;
    note: String;
}

contract StructRefFields {
    info: RefStruct;

    init() {
        self.info = RefStruct{
            addr: myAddress(),
            content: emptyCell(),
            note: "Hi"
        };
    }
}
