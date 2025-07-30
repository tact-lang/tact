struct S {
    a: Int;
    b: Bool;
}

contract OptionalStruct {
    val: S?;

    init() {
        self.val = null;
    }
}