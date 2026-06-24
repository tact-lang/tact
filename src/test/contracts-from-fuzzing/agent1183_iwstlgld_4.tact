struct OptionalInner {
    description: String?;
    active: Bool?;
}

contract OptionFieldsContract {
    optStruct: OptionalInner;

    init() {
        self.optStruct = OptionalInner{
            description: null,
            active: true,
        };
    }
}