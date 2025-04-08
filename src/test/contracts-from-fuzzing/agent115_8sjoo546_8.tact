struct S1 { a: Int; }
struct S2 { a: Int; b: S1?; }

contract Test {
    s: S2?;

    init() {
        self.s = S2{ a: 1, b: null };
    }
}