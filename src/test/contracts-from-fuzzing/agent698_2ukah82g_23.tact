struct N1 { a: Int; }
struct N2 { b: N1; }
struct N3 { c: N2; }

contract TestContract {
    data: N3;

    init() {
        self.data = N3{ c: N2{ b: N1{ a: 77 } } };
    }
}