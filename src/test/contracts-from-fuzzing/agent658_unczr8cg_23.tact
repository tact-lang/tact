struct X {
    s: String = "Hi";
    b: Bool = true;
}

contract WithStructDefaults {
    x: X;

    init() {
        self.x = X{};
    }
}