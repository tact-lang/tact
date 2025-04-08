struct DeepOptional {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionStorage {
    someVal: Int;
    optional: DeepOptional;

    init() {
        self.someVal = 5;
        self.optional = DeepOptional{
            optInt: 7,
            optBool: null,
            optString: "hello",
        };
    }
}