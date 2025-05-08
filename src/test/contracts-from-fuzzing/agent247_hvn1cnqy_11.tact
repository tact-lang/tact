struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "foo";
}

contract DefaultVals {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}