struct OptionalStruct {
    a: Int;
    b: String;
}

contract OptionalStructWrapper {
    maybe: OptionalStruct?;

    init() {
        self.maybe = OptionalStruct{a: 1, b: "hi"};
    }
}
