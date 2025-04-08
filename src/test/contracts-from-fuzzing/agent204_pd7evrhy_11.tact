struct SliceStruct {
    data: Slice;
    comment: String;
}

contract SliceFieldContract {
    field: SliceStruct;

    init() {
        self.field = SliceStruct{
            data: emptyCell().asSlice(),
            comment: "start"
        };
    }

    receive() {
        self.field.comment = "next";
    }
}