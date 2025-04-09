struct StructWithSliceDefault {
    data: Slice;
}

contract SliceNullField {
    inner: StructWithSliceDefault?;

    init() {
        self.inner = null;
    }
}
