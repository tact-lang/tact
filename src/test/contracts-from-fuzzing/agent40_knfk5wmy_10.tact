/// Combined tests for control flow, math, and compile-time constants

contract TestMapIteration {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 1);
        m.set(3, 2);
        m.set(7, 3);
        let firstKey: Int = 0;
        let first: Bool = true;
        foreach (k, v in m) {
            if (first) {
                firstKey = k;
                first = false;
            }
        }
        // Expected order: ascending keys, smallest should be 3
        if (firstKey != 3) { throw(123); }
        return;
    }
    receive() {
        self.run();
    }
}

contract TestDivisionRounding {
    fun run() {
        let a: Int = 3 / 2;         // expected 1
        if (a != 1) { throw(10); }
        let b: Int = (-3) / 2;        // expected -2
        if (b != -2) { throw(11); }
        let c: Int = 3 / (-2);        // expected -2
        if (c != -2) { throw(12); }
        let d: Int = (-3) / (-2);     // expected 1
        if (d != 1) { throw(13); }
        return;
    }
    receive() {
        self.run();
    }
}

contract TestConstEval {
    const a: Int = 5 + 7; // should be 12
    fun run() {
        if (self.a != 12) { throw(1); }
        let p: Int = pow2(3); // expected 8
        if (p != 8) { throw(2); }
        let q: Int = ton("1");
        if (q <= 0) { throw(3); }
        return;
    }
    receive() {
        self.run();
    }
}

contract TestBlockScoping {
    fun run() {
        let x: Int = 5;
        {
            let y: Int = 10;
            if (y != 10) { throw(20); }
        }
        if (x != 5) { throw(21); }
        return;
    }
    receive() {
        self.run();
    }
}
