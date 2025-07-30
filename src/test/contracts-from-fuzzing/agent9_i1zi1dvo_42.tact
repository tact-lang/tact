struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsNested {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}