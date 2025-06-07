struct OptStruct {
    maybeInt: Int?;
    maybeStr: String?;
    maybeBool: Bool?;
}

contract Test {
    optValue: OptStruct = OptStruct{ maybeInt: null, maybeStr: null, maybeBool: null };

    init() {
        self.optValue = OptStruct{ maybeInt: 10, maybeStr: "hi", maybeBool: true };
    }
}
