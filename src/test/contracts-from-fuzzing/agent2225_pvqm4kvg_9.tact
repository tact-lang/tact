struct Defaults {
    x: Int = 2;
    y: String = "default";
    z: Int?;
}

contract DefaultValues {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}