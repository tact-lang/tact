struct Nested {
    flag: Bool;
    count: Int;
}

contract TestContract {
    val: Int = 1;
    nested: Nested = Nested{flag: true, count: 5};

    init() {
        self.val = 42;
        self.nested = Nested{flag: false, count: 10};
    }
}