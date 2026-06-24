struct Nested {
    innerOpt: Int?;
    innerDefault: Int = 5;
}

contract DeepOptional {
    optStruct: Nested?;

    init() {
        self.optStruct = null;
    }
}