struct StructWithBoolIntString {
    f1: Bool;
    f2: Int;
    f3: String;
}

contract UseStruct {
    val: StructWithBoolIntString;

    init() {
        self.val = StructWithBoolIntString{
            f1: true,
            f2: 77,
            f3: "abc"
        };
    }
}
