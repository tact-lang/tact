struct S {
    foo: Int;
}

contract OptionalStruct {
    val: S?;

    init() {
        self.val = S{ foo: 1 };
    }
}