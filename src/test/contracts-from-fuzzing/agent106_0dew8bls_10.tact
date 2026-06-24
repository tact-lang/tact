struct OptStr {
    val: String?;
}

contract OptionalStringStructVar {
    foo: OptStr;

    init() {
        self.foo = OptStr{val: null};
    }

    receive() {
        self.foo = OptStr{val: "hello"};
    }
}