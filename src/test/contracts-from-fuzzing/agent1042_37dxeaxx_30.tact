struct HasOptSlice {
    s: Slice?;
}

contract OptionalSliceStruct {
    x: HasOptSlice;
    init() {
        self.x = HasOptSlice{s:null};
    }
}