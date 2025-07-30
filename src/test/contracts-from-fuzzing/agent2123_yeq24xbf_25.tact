struct S {
    a: Int;
    b: Bool;
}

contract OptionalNestedStruct {
    optS: S?;

    init() {
        self.optS = S{ a:42, b:true };
    }
}