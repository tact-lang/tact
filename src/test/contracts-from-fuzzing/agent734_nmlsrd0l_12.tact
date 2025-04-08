struct Defaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "abc";
}

contract StructWithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
