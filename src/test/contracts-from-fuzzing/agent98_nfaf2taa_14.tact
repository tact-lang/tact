struct Defaulted {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
    d: Int?; // default null
}

contract DefaultTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}