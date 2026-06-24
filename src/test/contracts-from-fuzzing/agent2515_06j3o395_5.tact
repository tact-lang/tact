struct OptionStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
    cellF: Cell?;
    sliceF: Slice?;
    builderF: Builder?;
}

contract OptionalsContract {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            foo: null,
            bar: null,
            baz: null,
            addr: null,
            cellF: null,
            sliceF: null,
            builderF: null
        };
    }
}
