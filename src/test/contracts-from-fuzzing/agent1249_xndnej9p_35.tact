struct Inner {
    slice: Slice;
}

struct Outer {
    inner: Inner;
}

contract SliceStructField {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                slice: emptyCell().asSlice()
            }
        };
    }
}