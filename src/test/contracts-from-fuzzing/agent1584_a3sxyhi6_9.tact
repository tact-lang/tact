struct DataStruct {
    builderField: Builder;
    flag: Bool;
    sliceField: Slice as remaining;
}

contract TestContract {
    data: DataStruct;

    init() {
        self.data = DataStruct{
            builderField: beginCell(),
            flag: true,
            sliceField: emptyCell().asSlice()
        };
    }
}