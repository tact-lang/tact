struct OptionStruct {
    s: String?;
    b: Bool?;
    addr: Address?;
    cell: Cell?;
}

contract OptStructInField {
    val: OptionStruct;

    init() {
        self.val = OptionStruct{
            s: null,
            b: null,
            addr: null,
            cell: null,
        };
    }
}