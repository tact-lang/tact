struct Defaulted {
    a: Int = 7;
    b: String = "test";
    c: Bool = false;
}

contract Defaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}