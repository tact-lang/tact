struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    optStruct: DeepOptional;

    init() {
        self.optStruct = DeepOptional{ a: null, b: null, c: null, d: null };
    }
}