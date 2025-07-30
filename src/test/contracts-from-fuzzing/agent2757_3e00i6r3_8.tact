struct Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultValues {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}