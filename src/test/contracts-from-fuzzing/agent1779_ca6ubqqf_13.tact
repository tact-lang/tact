struct OptionalDeep {
    s2: S2?;
}
struct S2 {
    s1: S1;
}
struct S1 {
    x: Int;
}

contract OptionalNestedDeep {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{s2: null};
    }
}