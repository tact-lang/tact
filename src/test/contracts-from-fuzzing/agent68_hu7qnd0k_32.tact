struct InnerOptSlice {
    s: Slice?;
}

struct OuterOptStruct {
    inner: InnerOptSlice?;
    flag: Bool;
}

contract OptSliceNest {
    data: OuterOptStruct;

    init() {
        self.data = OuterOptStruct{
            inner: null,
            flag: true
        };
    }
}
