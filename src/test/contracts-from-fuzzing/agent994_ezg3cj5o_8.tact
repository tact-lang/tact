struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract TestContract {
    def: Defaults;

    init() {
        self.def = Defaults{};
    }
}