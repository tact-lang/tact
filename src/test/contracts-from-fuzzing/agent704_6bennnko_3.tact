struct NestedOptional {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract NestedOptionalField {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            num: null,
            flag: true,
            text: "hello"
        };
    }
}