struct Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    f: Defaults;

    init() {
        self.f = Defaults{};
    }
}