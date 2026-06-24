struct WithBoolDefault {
    a: Int;
    b: Bool = true;
}

contract StructFieldDefaultBool {
    storage: WithBoolDefault;

    init() {
        self.storage = WithBoolDefault{ a: 10 };
    }
}