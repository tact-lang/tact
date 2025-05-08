struct Final {
    z: Int;
}

struct Root {
    a: Int;
    b: Int;
    c: Final;
}

contract StructOrderTest {
    s: Root;

    init() {
        self.s = Root{ a: 1, b: 2, c: Final{ z: 3 } };
    }
}
