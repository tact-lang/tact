struct Defaulted {
    i: Int = 5;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultStructStorage {
    value: Defaulted;
    init() {
        self.value = Defaulted{};
    }
}