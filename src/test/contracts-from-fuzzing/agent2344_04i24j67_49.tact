struct DeepDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello world";
}

contract NestedDef {
    s: DeepDefault;

    init() {
        self.s = DeepDefault{};
    }
}