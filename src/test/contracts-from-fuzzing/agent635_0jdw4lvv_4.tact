struct Deep3 { x3: Int; }
struct Deep2 { x2: Deep3; }
struct Deep1 { x1: Deep2; }

contract Test {
    d: Deep1;
    init() {
        self.d = Deep1{ x1: Deep2{ x2: Deep3{ x3: 42 } } };
    }
}