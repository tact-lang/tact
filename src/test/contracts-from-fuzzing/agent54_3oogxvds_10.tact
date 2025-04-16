struct S1{ a: Int; }
struct S2{ s1: S1; }

contract NestedOpt {
    data: S2?;
    init() {
        self.data = null;
    }
}