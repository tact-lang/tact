struct S {
    a: Int? = null;
    b: Int = 5;
    c: Bool? = null;
}

contract Defaults {
    x: S;
    init() {
        self.x = S{};
    }
}