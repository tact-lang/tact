struct StringStruct {
    s: String;
}

contract PersistStringStruct {
    val: StringStruct;
    init() {
        self.val = StringStruct{ s: "hello world" };
    }
}
