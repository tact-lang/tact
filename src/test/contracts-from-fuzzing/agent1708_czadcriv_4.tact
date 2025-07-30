struct ListWithDifferentSerialization {
    int_default: Int;
    int32: Int as uint32;
    int64: Int as int64;
    bool_val: Bool;
    addr: Address;
    cell_val: Cell;
    slice_val: Slice;
    str_val: String;
}

contract TestContract {
    state: ListWithDifferentSerialization;

    init() {
        self.state = ListWithDifferentSerialization{
            int_default: 123,
            int32: 456,
            int64: 789,
            bool_val: true,
            addr: myAddress(),
            cell_val: emptyCell(),
            slice_val: emptyCell().asSlice(),
            str_val: "hello"
        };
    }
}