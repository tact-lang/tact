struct StringStruct {
    a: String;
    b: String;
    c: String;
}

contract StringFields {
    val: StringStruct;

    init() {
        self.val = StringStruct{ a: "a", b: "b", c: "c" };
    }
}