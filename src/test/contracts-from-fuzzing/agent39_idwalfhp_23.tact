struct Defaulted {
    a: Int = 99;
    b: Bool = true;
}

contract Initialized {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}