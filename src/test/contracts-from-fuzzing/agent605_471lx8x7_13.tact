struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
    d: Int? = null;
    e: Bool? = null;
}

contract TestContract {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}