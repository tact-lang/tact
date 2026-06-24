// deeply nested chain
struct N5 { e: Int; }
struct N4 { d: N5; }
struct N3 { c: N4; }
struct N2 { b: N3; }
struct N1 { a: N2; }

contract Chain {
    val: N1;

    init() {
        self.val = N1{ a: N2{ b: N3{ c: N4{ d: N5{ e: 123 }}}}};
    }
}