struct NestedS {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructField {
    optStruct: NestedS?;

    init() {
        self.optStruct = null;
    }
}