struct Defaulted {
    x: Int = 42;
    y: Bool = true;
    z: String = "default";
}

contract Test {
    d: Defaulted;
    init() {
        self.d = Defaulted{};
    }
}