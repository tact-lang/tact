struct Nested {
    s1: String;
    s2: String?;
}

contract StringOptions {
    s: Nested;

    init() {
        self.s = Nested{ s1: "hi", s2: null };
    }
}
