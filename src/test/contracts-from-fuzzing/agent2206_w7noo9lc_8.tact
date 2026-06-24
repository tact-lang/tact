struct Defaults {
    a: Int = 42;
    b: String = "hello";
    c: Bool?; // default null
}

contract Test8 {
    def: Defaults;

    init() {
        self.def = Defaults{};
    }
}
