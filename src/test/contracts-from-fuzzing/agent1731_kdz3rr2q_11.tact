struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    foo: OptionalStruct?;

    init() {
        self.foo = null;
    }
}