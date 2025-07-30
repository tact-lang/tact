struct Defaulted {
    foo: Int = 42;
    bar: String = "hello";
    flag: Bool = false;
}

contract DefaultsContainer {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}