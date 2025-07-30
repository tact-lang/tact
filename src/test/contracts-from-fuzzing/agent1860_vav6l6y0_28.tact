struct S {
    a: Int?;
    b: Bool;
}

contract SetWholeStruct {
    val: S;

    init() {
        self.val = S{ a: null, b: true };
    }
}