struct StructWithSlice {
    s: Slice;
    opt: Slice?;
}

contract SlicePersistTest {
    data: StructWithSlice;

    init() {
        self.data = StructWithSlice{
            s: emptyCell().asSlice(),
            opt: null
        };
    }
}