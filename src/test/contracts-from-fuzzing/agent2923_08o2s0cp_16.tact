struct Combined {
    ival: Int = 0;
    flag: Bool = false;
    sval: String = "";
    addr: Address;
    cell: Cell;
    slice: Slice;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;
}

contract ComboMixedFields {
    data: Combined;

    init() {
        self.data = Combined{
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null
        };
    }
}