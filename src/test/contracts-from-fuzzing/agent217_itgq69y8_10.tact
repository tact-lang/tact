struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct InnerPlain {
    x: Int;
    y: String;
}

contract MixedNestedStorage {
    optStruct: InnerOpt = InnerOpt{a: null, b: true};
    plainStruct: InnerPlain;

    init() {
        self.plainStruct = InnerPlain{x: 5, y: "test"};
    }
}