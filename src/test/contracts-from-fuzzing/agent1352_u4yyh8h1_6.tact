struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int = 42;
    e: String = "bye";
}

contract TestContract {
    settings: Defaults;

    init() {
        self.settings = Defaults{};
    }
}
