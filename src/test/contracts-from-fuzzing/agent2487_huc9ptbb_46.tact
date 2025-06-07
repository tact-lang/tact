struct Defaults {
    a: Int = 42;
    b: Bool = false;
    s: String = "sample";
}

contract Test {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}