struct OptStruct {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestContract {
    foo: OptStruct;

    init() {
        self.foo = OptStruct{ a: 10 };
    }
}