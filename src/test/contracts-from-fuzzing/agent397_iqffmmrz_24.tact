struct TripleNest {
    x: DoubleNest;
}
struct DoubleNest {
    y: Inner;
}
struct Inner {
    z: Int;
}

contract TestContract {
    t: TripleNest;

    init() {
        self.t = TripleNest{ x: DoubleNest{ y: Inner{ z:33 } } };
    }
}