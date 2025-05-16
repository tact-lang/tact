struct Nested {
    n: Int;
    s: String;
    f: Bool;
}

contract TestContract {
    x: Nested = Nested{ n: 1, s: "a", f: true };
    y: Nested = Nested{ n: 2, s: "b", f: false };

    init() {
        self.x = Nested{ n: 11, s: "aa", f: false };
        self.y = Nested{ n: 22, s: "bb", f: true };
    }
}
