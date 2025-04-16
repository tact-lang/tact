struct SliceBuilderHolder {
    s: Slice;
    b: Builder;
}

contract HoldsSlices {
    data: SliceBuilderHolder;

    init() {
        self.data = SliceBuilderHolder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}
