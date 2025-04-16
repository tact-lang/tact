struct ExplicitSerStruct {
    a: Int as int8;
    b: Int as uint64;
    c: Int;
}

contract ExplicitSerStorage {
    val: ExplicitSerStruct;

    init() {
        self.val = ExplicitSerStruct{a:5, b:10, c:15};
    }
}