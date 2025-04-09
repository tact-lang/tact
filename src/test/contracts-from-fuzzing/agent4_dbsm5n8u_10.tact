struct S {
    text: String;
    num: Int;
}

contract TestContract {
    s1: S;
    n: Int;
    s2: S;
    t: String;

    init() {
        self.s1 = S{ text: "foo", num: 1 };
        self.n = 42;
        self.s2 = S{ text: "bar", num: 2 };
        self.t = "test";
    }
}