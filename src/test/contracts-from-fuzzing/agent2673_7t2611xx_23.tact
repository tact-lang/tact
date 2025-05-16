struct S {
    s1: String;
    s2: String?;
}

contract StringMix {
    data: S;

    init() {
        self.data = S{ s1: "abc", s2: null };
    }
}