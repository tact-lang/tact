struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullStruct {
    val: S;
    init() {
        self.val = S{a: null, b: null, c: null};
    }
}