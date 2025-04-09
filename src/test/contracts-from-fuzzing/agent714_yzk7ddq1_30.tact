struct A {
    foo: Int;
}

contract OptionalStruct {
    val: A?;

    init() {
        self.val = A{ foo: 1 };
    }
}