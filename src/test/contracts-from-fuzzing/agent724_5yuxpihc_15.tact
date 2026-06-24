struct OptStruct {
    a: Int?;
    b: String?;
}

contract OptionalOfStruct {
    foo: OptStruct?;

    init() {
        self.foo = null;
    }
}