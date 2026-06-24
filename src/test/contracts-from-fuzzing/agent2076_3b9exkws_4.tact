struct Defaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "test";
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}