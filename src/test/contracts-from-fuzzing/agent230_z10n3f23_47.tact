struct OptInStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract StructMiddleOpt {
    val: OptInStruct;

    init() {
        self.val = OptInStruct { a:42, b:null, c:"hello" };
    }
}
