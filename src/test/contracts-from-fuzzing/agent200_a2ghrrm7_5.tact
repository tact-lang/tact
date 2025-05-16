struct OptStruct {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
    str: String?;
}

contract OptionalStructField {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            foo: null,
            bar: null,
            addr: null,
            cell: null,
            slice: null,
            str: null,
        };
    }
}