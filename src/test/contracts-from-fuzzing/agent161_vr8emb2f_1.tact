struct OptionalNested {
    innerFlag: Bool?;
    innerStr: String?;
    innerInt: Int?;
}

contract TestOptionalNested {
    nestedOpt: OptionalNested;

    init() {
        self.nestedOpt = OptionalNested{
            innerFlag: null,
            innerStr: null,
            innerInt: null,
        };
    }
}
