struct OptionalSlice {
    data: Slice?;
}

contract SliceOptionalTest {
    field: OptionalSlice;

    init() {
        self.field = OptionalSlice{
            data: emptyCell().asSlice()
        };
    }
}
