struct MultiTypeStruct {
    flag: Bool;
    count: Int;
    text: String;
    data: Cell;
    addr: Address;
    slice: Slice;
    builder: Builder;
}

contract MultiTypeStructContract {
    field: MultiTypeStruct;
    init() {
        self.field = MultiTypeStruct{
            flag: true,
            count: 123,
            text: "abc",
            data: emptyCell(),
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}