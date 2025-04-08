struct S1 {
    a: Int = 1;
}
struct S2 {
    b: S1 = S1{};
}

contract NestedWithDefaults {
    s2: S2;
    init() {
        self.s2 = S2{};
    }
}