struct Defaults {
    foo: Int = 17;
    bar: Bool = false;
}

contract TestContract {
    stuff: Defaults;

    init() {
        self.stuff = Defaults{};
    }
}