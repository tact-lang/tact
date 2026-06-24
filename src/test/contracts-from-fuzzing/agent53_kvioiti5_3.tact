struct OptionalNested {
    innerOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
}

contract TestOptionalNested {
    st: OptionalNested;

    init() {
        self.st = OptionalNested{
            innerOpt: null,
            boolOpt: true,
            addressOpt: null
        };
    }
}