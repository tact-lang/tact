struct Nested {
    s: String = "";
    b: Bool = false;
}

contract TestContract {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    n4: Nested;

    init() {
        self.n1 = Nested{ s: "a", b: true };
        self.n2 = Nested{ s: "b", b: false };
        self.n3 = Nested{ s: "c", b: true };
        self.n4 = Nested{ s: "d", b: false };
    }

    receive() {
        self.n3.s = "changed";
    }
}