struct OptionalStruct {
    val: Int?;
    str: String?;
    addr: Address?;
    cell: Cell?;
}

contract OptionalStructHolder {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: null,
            str: null,
            addr: null,
            cell: null,
        };
    }
}