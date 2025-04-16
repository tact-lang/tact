struct Inner {
    a: Int;
    b: Bool;
}

contract FuzzTest {
    field1: Int;
    field2: Bool;
    nested: Inner;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.nested = Inner{a: 2, b: false};
    }
}