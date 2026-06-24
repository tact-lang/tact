struct OptionalFields {
    o1: Int?;
    o2: Int?;
    o3: Int?;
}

contract OptionalsTest {
    optStruct: OptionalFields;

    init() {
        self.optStruct = OptionalFields{
            o1: null,
            o2: 42,
            o3: null
        };
    }
}