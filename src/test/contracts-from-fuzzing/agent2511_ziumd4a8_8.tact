struct Defaults {
    x: Int = 42;
    y: Bool = false;
    z: String = "default";
}

contract DefaultVals {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}