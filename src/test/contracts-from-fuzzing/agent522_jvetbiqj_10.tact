struct InnerBool {
    val: Bool;
}

struct WithDefault {
    nested: InnerBool = InnerBool { val: true };
    flag: Bool = false;
}

contract StructWithDefaults {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}