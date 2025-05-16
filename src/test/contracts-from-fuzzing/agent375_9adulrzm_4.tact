struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
