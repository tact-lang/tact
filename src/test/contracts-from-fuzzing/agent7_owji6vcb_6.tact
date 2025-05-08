struct Defaulted {
    foo: Int = 10;
    bar: Bool = false;
}

contract Test {
    val: Defaulted;
    init() {
        self.val = Defaulted{};
    }
}