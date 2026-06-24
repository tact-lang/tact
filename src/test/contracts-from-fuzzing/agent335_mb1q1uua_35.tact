struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract OnlyDefaultsContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}