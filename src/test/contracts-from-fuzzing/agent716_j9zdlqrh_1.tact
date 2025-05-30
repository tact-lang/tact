struct Nested {
    inner1: Int?;
    inner2: Bool;
}

contract DeepOptional {
    optStruct: Nested?;

    init() {
        self.optStruct = null;
    }
}