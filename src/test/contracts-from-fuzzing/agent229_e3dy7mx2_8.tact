struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "def";
}

contract DefaultsNested {
    d: Defaults;
    
    init() {
        self.d = Defaults{};
    }
}
