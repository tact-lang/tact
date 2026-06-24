struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int?; // implicitly null
}

contract StructWithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}