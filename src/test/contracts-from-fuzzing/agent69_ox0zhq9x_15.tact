struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "123";
}

contract Defaults {
    s: S;

    init() {
        self.s = S{};
    }
}
