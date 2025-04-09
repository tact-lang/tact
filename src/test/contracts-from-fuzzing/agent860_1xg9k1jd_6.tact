contract NullableFields {
    flag: Bool?;
    num: Int?;
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
    str: String?;

    init() {
        self.flag = null;
        self.num = 42;
        self.addr = null;
        self.cell = null;
        self.slice = null;
        self.str = null;
    }
}