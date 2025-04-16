struct Complex {
    opt: Int? = null;
    m: map<Int, Int>;
}

contract TestComplex {
    receive() {
        let c: Complex = Complex {
            opt: 5,
            m: emptyMap()
        };
        if (c.opt != null) {
            dump(c.opt);
        } else {
            dump(0);
        }
        // Also test map usage: insert and retrieve a value
        c.m.set(100, 200);
        let val = c.m.get(100);
        if (val != null) {
            dump(val);
        }
    }
}
