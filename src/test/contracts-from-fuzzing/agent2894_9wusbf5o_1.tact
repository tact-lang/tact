struct S1 { val1: Int; }
struct S2 { s1: S1; val2: Int; }
contract Test {
    data: S2;
    init() {
        self.data = S2{ s1: S1{ val1: 1 }, val2: 2 };
    }
}