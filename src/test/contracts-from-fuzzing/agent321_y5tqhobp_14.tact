struct OptionalOuter {
    field1: Int;
    field2: Bool;
    nestedOpt: Int?;
}

contract OptionalStructTest {
    s: OptionalOuter;
    init() {
        self.s = OptionalOuter{
            field1: 10,
            field2: true,
            nestedOpt: null
        };
    }
}