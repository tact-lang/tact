struct Defaulted {
    x: Int = 1;
    y: String = "hello";
    z: Bool = false;
}

contract DefaultsCompile {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}