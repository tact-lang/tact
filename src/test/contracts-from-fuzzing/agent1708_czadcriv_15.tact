struct NestedSliceWithString {
    s1: InnerSlice;
    s2: String;
}

struct InnerSlice {
    slc: Slice;
    str: String;
}

contract TestContract {
    data: NestedSliceWithString;

    init() {
        self.data = NestedSliceWithString{
            s1: InnerSlice{
                slc: emptyCell().asSlice(),
                str: "abc"
            },
            s2: "def"
        };
    }
}