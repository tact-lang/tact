struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract Test {
    s: Nested;

    init() {
        self.s = Nested{inner1: 5, inner2: false};
    }

    receive() {
        let _ = self.s.inner1;
    }
}