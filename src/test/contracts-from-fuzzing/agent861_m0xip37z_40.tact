struct A {
    foo: Int;
}

contract OptNestedStruct {
    b: A?;

    init() {
        self.b = null;
    }
}
