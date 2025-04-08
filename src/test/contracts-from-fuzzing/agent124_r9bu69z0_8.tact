struct Defaulted {
    name: String = "abc";
    age: Int = 25;
}

contract TestDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}