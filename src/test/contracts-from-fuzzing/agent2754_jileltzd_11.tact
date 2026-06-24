struct HasBool {
    f: Bool;
}

contract OptionalNestedStruct {
    maybeStruct: HasBool?;

    init() {
        self.maybeStruct = null;
    }
}
