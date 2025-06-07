struct WithDefault {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract StructDefaultFields {
    value: WithDefault;

    init() {
        self.value = WithDefault{};
    }
}