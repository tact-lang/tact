struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract StructWithDefaults {
    data: Defaults;
    init() {
        self.data = Defaults{};
    }
}