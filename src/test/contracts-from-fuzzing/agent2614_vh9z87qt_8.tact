struct OptionalNested {
    innerOpt: Int?;
    nestedOpt: String?;
}

struct HasOptionalStruct {
    nested: OptionalNested?;
}

contract OptionalStructField {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{
            nested: null
        };
    }
}