struct Defaults {
    i: Int = 123;
    b: Bool = true;
    s: String = "hello";
}

contract TestContract {
    d: Defaults;
    init() {
        self.d = Defaults{};
    }
}