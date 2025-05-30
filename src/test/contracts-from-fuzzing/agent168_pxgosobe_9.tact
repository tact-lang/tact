struct S {
    s1: String;
    s2: String?;
}

contract TestStringOptionals {
    f: S;

    init() {
        self.f = S{ s1: "abc", s2: null };
    }
}