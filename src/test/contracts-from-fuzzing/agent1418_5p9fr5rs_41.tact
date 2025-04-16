struct S1 { a: Int as uint8; b: Int as uint8; }
struct S2 { c: Int as uint8; d: Int; }
struct Combined { x: S1; y: S2; }

contract NestedWithHints {
    val: Combined;

    init() {
        self.val = Combined{
            x: S1{ a:1, b:2 },
            y: S2{ c:3, d:4 },
        };
    }
}