struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: String?;
}

contract DefaultStructTest {
    v: Defaulted;

    init() {
        self.v = Defaulted{};
    }
}