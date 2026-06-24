struct AddressCellSliceOptional {
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
}

contract OptionalACS {
    data: AddressCellSliceOptional;

    init() {
        self.data = AddressCellSliceOptional{
            addr: null,
            cell: emptyCell(),
            slice: null
        };
    }
}