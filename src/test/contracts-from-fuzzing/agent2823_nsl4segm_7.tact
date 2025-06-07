struct Defaulted {
    x: Int = 1;
    y: Int?;
}

contract DefaultsAndOptionals {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}