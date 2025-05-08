struct StrNest {
    text: String;
}

struct SliceNest {
    slice: Slice;
    strnest: StrNest;
}

contract CellSliceFields {
    data: SliceNest;
    init() {
        self.data = SliceNest{
            slice: emptyCell().asSlice(),
            strnest: StrNest{ text: "hi" }
        };
    }
}