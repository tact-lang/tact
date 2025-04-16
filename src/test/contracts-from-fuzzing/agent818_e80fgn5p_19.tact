struct L {
    val: Int;
}
struct M {
    val: Int;
}
struct N {
    val: Int;
}
struct O {
    val: Int;
}
struct P {
    val: Int;
}
struct Q {
    val: Int;
}
contract ManyStructs {
    l: L;
    m: M;
    n: N;
    o: O;
    p: P;
    q: Q;
    init() {
        self.l = L{val:1};
        self.m = M{val:2};
        self.n = N{val:3};
        self.o = O{val:4};
        self.p = P{val:5};
        self.q = Q{val:6};
    }
}