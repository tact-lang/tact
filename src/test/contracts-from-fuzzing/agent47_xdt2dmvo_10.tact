struct Nested {
    x: Int;
    y: Int?;
}

struct Complex {
    m: map<Int, Nested>;
    opt: Int?;
}

contract TestContract {
    receive() {
        let cs: Complex = Complex {
            m: emptyMap(),
            opt: 42
        };
        cs.m.set(1, Nested { x: 100, y: null });
        cs.opt;
    }
}
