struct NestedSlices {
    first: Slice;
    second: Slice;
    third: Slice;
}

contract TestStorage {
    data: NestedSlices;

    init() {
        let slice = emptyCell().asSlice();
        self.data = NestedSlices{
            first: slice,
            second: slice,
            third: slice
        };
    }
}