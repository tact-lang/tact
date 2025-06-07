struct NestedSliceHolder {
    a: Int;
    b: Holder;
}

struct Holder {
    slice: Slice;
    val: Int;
}

contract NestedSlices {
    inner: NestedSliceHolder;

    init() {
        self.inner = NestedSliceHolder{
            a: 5,
            b: Holder{
                slice: emptyCell().asSlice(),
                val: 6
            }
        };
    }
}