struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "ok";
}

contract StructInits {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
