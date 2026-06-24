struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested { a: 10, b: true };
    }

    receive() {
        dump(self.s.a);
        dump(self.s.b);
    }
}
