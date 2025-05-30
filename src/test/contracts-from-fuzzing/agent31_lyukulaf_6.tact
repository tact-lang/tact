struct L {
    s: S;
}

struct M {
    l: L;
}

struct N {
    m: M;
}

struct O {
    n: N;
}

struct P {
    o: O;
}

struct S {
    value: Int;
}

contract DeepChainTest {
    field: P;

    init() {
     self.field = P{ o: O{ n: N{ m: M{ l: L{ s: S{ value: 42 } } } } } };
    }
}
