struct StringStruct {
    s: String;
    num: Int;
}

contract StructStrings {
    val: StringStruct;

    init() {
        self.val = StringStruct{ s: "hi", num: 1 };
    }
}