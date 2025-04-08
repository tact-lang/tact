struct PrimitiveNest {
    i: Int;
    b: Bool;
    s: String;
}

struct MidLayer {
    inner1: PrimitiveNest;
    inner2: PrimitiveNest;
}

contract DeepNestingTest {
    nested: MidLayer;

    init() {
        self.nested = MidLayer{
            inner1: PrimitiveNest{i: 1, b: true, s: "x"},
            inner2: PrimitiveNest{i: 2, b: false, s: "y"}
        };
    }
}
