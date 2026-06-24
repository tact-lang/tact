struct Defaults {
    x: Int = 42;
    y: Bool = false;
    s: String = "foo";
    o: Int?; // defaults to null automatically
}

contract StructWithDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}