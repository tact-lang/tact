struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract StructWithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}