struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
}

contract DefaultVals {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}