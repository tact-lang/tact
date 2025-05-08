struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int?; // implicitly defaults to null
}

contract StructDefaults {
    f: Defaults;

    init() {
        self.f = Defaults{};
    }
}
