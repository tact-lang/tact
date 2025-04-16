struct DefaultVals {
    a: Int = 123;
    b: String = "bar";
    c: Bool = false;
    d: Address; // no default
}

contract DefaultStructInit {
    foo: DefaultVals;

    init() {
        self.foo = DefaultVals{ d: myAddress() };
    }
}