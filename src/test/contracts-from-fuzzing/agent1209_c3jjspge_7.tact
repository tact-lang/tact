struct Defaulted {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract Defaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
