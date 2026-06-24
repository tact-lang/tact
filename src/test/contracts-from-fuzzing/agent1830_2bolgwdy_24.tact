struct SliceString {
    sliceVal: Slice;
    strVal: String;
}

contract TestContract {
    data: SliceString;

    init() {
        self.data = SliceString{
            sliceVal: emptyCell().asSlice(),
            strVal: "foobar"
        };
    }
}
