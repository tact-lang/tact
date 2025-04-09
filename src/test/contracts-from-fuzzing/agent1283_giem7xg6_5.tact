struct WithDefaults {
    foo: Int;
    opt1: Int?; // no default, so implicitly null
    opt2: Bool?; // implicitly null
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            foo: 7,
            // opt1 omitted
            // opt2 omitted
        };
    }
}