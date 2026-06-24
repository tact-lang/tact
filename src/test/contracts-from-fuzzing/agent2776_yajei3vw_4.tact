struct OptionalStruct {
    innerOpt: Int?;
}

contract OptionalFieldTest {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}
