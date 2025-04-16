struct Varied {
    flag: Bool;
    txt: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    builder: Builder;
    num: Int;
    optInt: Int?;
    optBool: Bool?;
}

contract VariedFieldsContract {
    data: Varied;

    init() {
        self.data = Varied{
            flag: true,
            txt: "hi",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
            num: 7,
            optInt: null,
            optBool: null,
        };
    }
}