struct AllTypes {
    addr: Address;
    sl: Slice;
    cl: Cell;
    str: String;
    optInt: Int?;
    optBool: Bool?;
}

contract AllTypesContract {
    data: AllTypes;

    init() {
        self.data = AllTypes{
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            str: "test",
            optInt: null,
            optBool: true
        };
    }
}