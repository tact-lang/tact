struct NestedOptionalSlice {
    inner: Slice?;
}

contract TestContract {
    data: NestedOptionalSlice;

    init() {
        self.data = NestedOptionalSlice{
            inner: emptyCell().asSlice()
        };
    }
}