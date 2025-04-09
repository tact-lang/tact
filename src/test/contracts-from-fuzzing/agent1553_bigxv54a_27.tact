struct S {
    i1: Int?;
    s1: String?;
    i2: Int?;
    s2: String?;
}

contract ManyOptionals {
    s: S;

    init() {
        self.s = S{};
    }
}