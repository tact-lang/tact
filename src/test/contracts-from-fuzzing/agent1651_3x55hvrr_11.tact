struct S0 {
    a: Int;
}

struct S1 {
    s0opt: S0?;
    s0req: S0;
}

contract Test11 {
    value: S1;

    init() {
        self.value = S1{ s0opt: null, s0req: S0{a: 1} };
    }
}
