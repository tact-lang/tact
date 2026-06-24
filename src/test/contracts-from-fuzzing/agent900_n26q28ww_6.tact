struct OptionalNest {
    a: Int?;
    b: Bool?;
}

contract Test {
    optStruct: OptionalNest?;

    init() {
        self.optStruct = null;
    }

    receive() {
        self.optStruct = OptionalNest { a: 42, b: true };
    }
}