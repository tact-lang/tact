struct InnerOpt {
    foo: Int?
}

contract OptionalFieldTest {
    optStruct: InnerOpt?;

    init() {
        self.optStruct = InnerOpt{
            foo: null
        };
    }
}