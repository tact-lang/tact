struct MultiOptional {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract Test {
    optStruct: MultiOptional;

    init() {
        self.optStruct = MultiOptional{s: null, b: null, i: null};
    }
}
