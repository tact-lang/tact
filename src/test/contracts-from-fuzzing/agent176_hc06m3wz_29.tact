struct OptionalInStruct {
    innerOpt: Int?;
    innerBool: Bool?;
}

contract InStructOptFields {
    val: OptionalInStruct = OptionalInStruct{
        innerOpt: null,
        innerBool: true
    };

    init() {
        self.val = OptionalInStruct{
            innerOpt: 42,
            innerBool: null
        };
    }
}