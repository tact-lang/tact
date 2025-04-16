struct OptionalWrap {
    innerInt: Int?;
    innerBool: Bool?;
    innerStr: String?;
}

contract OptionalFields {
    opt: OptionalWrap;

    init() {
        self.opt = OptionalWrap{
            innerInt: null,
            innerBool: null,
            innerStr: null
        };
    }
}