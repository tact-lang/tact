struct Defaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "tact";
}

contract Test {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
