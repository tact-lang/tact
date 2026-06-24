struct Defaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "test";
}

contract TestContract {
    def: Defaults;

    init() {
        self.def = Defaults{};
    }
}
