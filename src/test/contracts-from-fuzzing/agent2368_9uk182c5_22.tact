struct Defaults {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultFields {
    st: Defaults;

    init() {
        self.st = Defaults{};
    }
}