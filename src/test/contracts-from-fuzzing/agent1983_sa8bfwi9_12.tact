struct SliceHolder {
    s: Slice?;
}

contract OptSliceField {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            s: null
        };
    }
}