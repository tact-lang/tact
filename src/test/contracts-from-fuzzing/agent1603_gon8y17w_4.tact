struct OptionalVals {
    n1: Int?;
    n2: Bool?;
}

contract OptionalStructFieldTest {
    optStruct: OptionalVals;

    init() {
        self.optStruct = OptionalVals{
            n1: null,
            n2: true,
        };
    }
}