struct S1 {
    a: Int; b: Bool;
}
struct S2 {
    s: S1?;
}
contract Test {
    data: S2;
    init() {
        self.data = S2{ s: null };
    }
}