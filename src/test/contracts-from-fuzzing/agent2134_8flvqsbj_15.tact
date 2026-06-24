struct StructWithSlices {
    a: Slice;
    opt: Slice?;
    str: String;
}

contract SliceStructContract {
    data: StructWithSlices;

    init() {
        self.data = StructWithSlices{
            a: emptyCell().asSlice(),
            opt: null,
            str: "slice test"
        };
    }
}