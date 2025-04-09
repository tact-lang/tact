struct DefaultsOnly {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
}

contract TestContract {
    stuff: DefaultsOnly;

    init() {
        self.stuff = DefaultsOnly{};
    }
}