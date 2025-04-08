struct DeepOptional {
    innerOpt: String?;
    numberOpt: Int?;
}

contract OptionalFields {
    optionalField: DeepOptional?;
    
    init() {
        self.optionalField = DeepOptional{
            innerOpt: "hello",
            numberOpt: 42,
        };
    }
}