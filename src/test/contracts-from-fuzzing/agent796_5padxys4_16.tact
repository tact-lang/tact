struct Defaults {
    x: Int = 10;
    y: Int = 20;
}

contract Test {
    data: Defaults;
    init() {
        self.data = Defaults{};
    }
}