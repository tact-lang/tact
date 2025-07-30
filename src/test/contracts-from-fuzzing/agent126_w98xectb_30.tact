struct HasBool {
    f: Bool;
}

contract NestedBoolOpt {
    optStruct: HasBool?;

    init() {
        self.optStruct = null;
    }
}