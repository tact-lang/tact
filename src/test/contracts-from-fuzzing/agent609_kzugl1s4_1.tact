struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int = 0;
    field2: Bool = false;
    field3: String = "test";
    nested: Inner = Inner{a: 1, b: true};

    init() {
        self.field1 = 42;
    }
}