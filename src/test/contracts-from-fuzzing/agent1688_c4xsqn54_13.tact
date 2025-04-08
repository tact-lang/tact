struct Defaults {
    x: Int = 1;
    y: String = "hello";
    b: Bool = false;
}

contract DefaultVals {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}