contract TestOptionalCorrect {
    fun test() {
        let opt: Int? = null;
        opt = 100;
        // This should print 100
        dump(opt!!);
    }
    receive() { self.test(); }
}

contract TestMap {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        // This should print 10
        dump(m.get(1)!!);
        // This should print false
        dump(m.exists(2));
    }
    receive() { self.test(); }
}

struct One { number: Int; }

contract TestStruct {
    fun test() {
        let a: One = One { number: 42 };
        let cell = a.toCell();
        let a2 = One.fromCell(cell);
        // This should print 42
        dump(a2.number);
    }
    receive() { self.test(); }
}
