struct Defaults {
    a: Int = 1;
    b: String = "";
    c: Bool = false;
}

contract DefaultFields {
    f: Defaults;
    init() {
        self.f = Defaults{};
    }
}