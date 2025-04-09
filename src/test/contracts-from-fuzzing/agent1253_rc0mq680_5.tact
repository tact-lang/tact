struct Defaulted {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
}

contract Test {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}
