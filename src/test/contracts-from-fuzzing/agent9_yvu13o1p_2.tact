struct Inner {
    a: Int as uint64;
    b: String;
    c: Int?;
}

contract TestContract {
    field1: Int;
    innerField: Inner;

    init() {
        self.field1 = 1;
        self.innerField = Inner{a: 2, b: "abc", c: null};
    }

    receive() {
        self.field1 = 3;
        self.innerField = Inner{a: 4, b: "def", c: 5};
    }
}