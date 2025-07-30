struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int = 1;
    field2: Bool = false;
    field3: String = "abc";
    nested: Inner = Inner{a: 5, b: true};

    init() {
        self.field1 = 123;
    }
}