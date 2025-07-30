struct CommentsInStruct {
    valInt: Int; // some int
    valBool: Bool; // a flag
    valStr: String; // text field
}

contract DocCommentsTest {
    field: CommentsInStruct;

    init() {
        self.field = CommentsInStruct {
            valInt: 42,
            valBool: true,
            valStr: "hi"
        };
    }
}