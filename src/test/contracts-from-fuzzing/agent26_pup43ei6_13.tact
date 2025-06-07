struct Defaults {
    x: Int = 10;
    y: Bool = false;
    s: String = "abc";
}

contract Test13 {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}