struct Defaults {
    x: Int = 123;
    y: Bool = true;
    s: String = "hello";
}

contract DefaultValues {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}