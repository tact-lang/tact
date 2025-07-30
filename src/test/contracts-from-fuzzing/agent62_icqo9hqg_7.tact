struct NestedStr {
    innerOpt: Int?;
    innerStr: String?;
}

contract OptionalNestedFields {
    data: NestedStr;

    init() {
        self.data = NestedStr{
            innerOpt: null,
            innerStr: null,
        };
    }
}