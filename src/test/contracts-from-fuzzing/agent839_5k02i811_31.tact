struct WithBool {
    a: Bool;
}

contract OptionalBoolStruct {
    v: WithBool?;
    init() {
        self.v = null;
    }
}