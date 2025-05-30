struct ContainsBool {
    x: Bool;
}

contract OptionalNestedStruct {
    f: ContainsBool?;

    init() {
        self.f = null;
    }
}