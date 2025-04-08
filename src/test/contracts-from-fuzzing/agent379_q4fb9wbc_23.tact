struct A {
    num: Int;
}

contract OptionalStruct {
    field: A?;

    init() {
        self.field = null;
    }
}