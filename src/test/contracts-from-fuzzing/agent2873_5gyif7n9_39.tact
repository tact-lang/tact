struct S {
    optionalStr: String?;
    someInt: Int;
}

contract OptionalStringStruct {
    s: S;
    init() {
        self.s = S{ optionalStr: null, someInt: 5 };
    }
}