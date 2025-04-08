struct EmptySliceString {
    s: Slice;
    t: String;
}

contract EmptySlicesAndStrings {
    val: EmptySliceString;

    init() {
        self.val = EmptySliceString{
            s: emptyCell().asSlice(),
            t: "",
        };
    }
}