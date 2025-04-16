struct HasSliceAndString {
    s: Slice;
    t: String;
}

contract Test {
    data: HasSliceAndString;
    init() {
        self.data = HasSliceAndString{
            s: emptyCell().asSlice(),
            t: "world"
        };
    }
}