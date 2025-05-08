struct X {
    a: Int;
    b: Int?;
}

contract TestContract {
    foo: Int;
    optStruct: X?;

    init() {
        self.foo = 42;
        self.optStruct = null;
    }
}