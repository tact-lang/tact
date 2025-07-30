struct Deep1 { x: Int; }
struct Deep2 { a: Deep1; }
struct Deep3 { b: Deep2; }
struct Deep4 { c: Deep3; }
struct Deep5 { d: Deep4; }

contract Test {
    payload: Deep5;

    init() {
        self.payload = Deep5{ d: Deep4{ c: Deep3{ b: Deep2{ a: Deep1{ x: 42 } } } } };
    }
}