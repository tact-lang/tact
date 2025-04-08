struct Defaulted {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
}

contract Test {
    foo: Defaulted;

    init() {
        self.foo = Defaulted{};
    }
}