struct Defaulted {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultFields {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}