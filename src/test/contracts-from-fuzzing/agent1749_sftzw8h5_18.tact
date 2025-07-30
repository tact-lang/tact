struct OptionalStringNested {
    message: String?;
}

contract OptionalStringInStruct {
    opt: OptionalStringNested;

    init() {
        self.opt = OptionalStringNested{
            message: null,
        };
    }
}