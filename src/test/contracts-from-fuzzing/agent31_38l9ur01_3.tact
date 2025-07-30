struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: String? = null;
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
