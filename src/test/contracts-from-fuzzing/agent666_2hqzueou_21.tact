struct S {
    flag: Bool = false;
    text: String = "";
    number: Int = 0;
}

contract DefaultStructs {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{};
        self.s2 = S{};
    }
}