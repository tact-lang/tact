struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructTest {
    maybe: OptionalStruct?;

    init() {
        self.maybe = OptionalStruct{x: 42, y: true};
    }
}