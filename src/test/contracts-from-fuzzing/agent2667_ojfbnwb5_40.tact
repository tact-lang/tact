struct StructWithStringAndSlice {
    txt: String;
    data: Slice;
}

contract StringSliceContract {
    s: StructWithStringAndSlice;

    init() {
        self.s = StructWithStringAndSlice{
            txt:"data", data: emptyCell().asSlice()
        };
    }

    receive() {
        self.s = StructWithStringAndSlice{
            txt: "more", data: emptyCell().asSlice()
        };
    }
}