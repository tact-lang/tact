struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultStructStorage {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}