struct Defaulted {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

contract DefaultStructTest {
    def: Defaulted;

    init() {
        self.def = Defaulted{};
    }
}