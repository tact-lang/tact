contract OptionalsTest {
    optInt: Int?;
    optStruct: Nested?;

    init() {
        self.optInt = null;
        self.optStruct = null;
    }
}

struct Nested {
    a: Int;
    b: Bool;
}