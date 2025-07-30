struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsStruct {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}