struct Defaulted {
    a: Int = 1;
    b: String = "x";
    c: Bool?;
}

contract DefaultsComb {
    foo: Defaulted;

    init() {
        self.foo = Defaulted{};
    }
}