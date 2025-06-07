struct Defaulted {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
}

contract DefaultsPersistence {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}