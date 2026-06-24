struct Defaulted {
    a: Int = 7;
    b: Bool = true;
    c: String = "test";
}

contract Defaults {
    d: Defaulted;
    init() {
        self.d = Defaulted{};
    }
}