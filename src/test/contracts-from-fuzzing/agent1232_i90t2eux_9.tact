struct S {
    one: Int = 1;
    two: Int = 2;
    three: Int = 3;
}

contract DefaultsNested {
    s: S;

    init() {
        self.s = S{};
    }
}