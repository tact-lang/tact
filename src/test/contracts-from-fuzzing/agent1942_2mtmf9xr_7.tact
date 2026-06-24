struct Defaulted {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultedPersist {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}