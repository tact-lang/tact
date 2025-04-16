struct DefaultValues {
    a: Int = 7;
    b: Bool = true;
    s: String = "abc";
}

contract DefaultsContract {
    x: DefaultValues;

    init() {
        self.x = DefaultValues{};
    }
}