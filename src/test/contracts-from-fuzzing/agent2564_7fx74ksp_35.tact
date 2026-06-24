struct OptionalOfStruct {
    s: Int;
}

contract OptionalStructContainer {
    foo: OptionalOfStruct?;

    init() {
        self.foo = null;
    }
}