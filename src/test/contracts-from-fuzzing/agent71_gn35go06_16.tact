struct DefaultsAndOptionals {
    x: Int = 10;
    y: Int?;
    z: Bool = false;
}

contract TestContract {
    stuff: DefaultsAndOptionals;

    init() {
        self.stuff = DefaultsAndOptionals{};
    }
}