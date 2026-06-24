struct S {
    a: Int;
}

contract OptNestedOptStruct {
    data: S?;

    init() {
        self.data = null;
    }
}
