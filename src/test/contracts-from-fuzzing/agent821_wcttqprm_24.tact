// test persistent slice value (primitive)
contract TestSlicePrimitive {
    data: Slice;

    init() {
        self.data = emptyCell().asSlice();
    }
}
