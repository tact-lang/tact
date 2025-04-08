struct S1 { a: Int; }
struct S2 { b: Int; s1: S1; }

contract TestContract {
    nested: S2;

    init() {
        self.nested = S2{
            b: 5,
            s1: S1{ a: 10 }
        };
    }
}