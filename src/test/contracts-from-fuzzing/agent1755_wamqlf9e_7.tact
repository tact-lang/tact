struct Defaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultStructs {
    def: Defaults;
    init() {
        self.def = Defaults{};
    }
}