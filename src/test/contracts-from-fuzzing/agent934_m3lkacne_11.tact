struct OptionalOptInStruct {
    f1: Int?;
    f2: Bool?;
}

contract DoubleOptional {
    nestedOpt: OptionalOptInStruct?;

    init() {
        self.nestedOpt = OptionalOptInStruct{
            f1: null,
            f2: true,
        };
    }
}