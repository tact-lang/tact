contract UnderscoreVariableTestContract {
    init() {
        // Nothing to do
    }

    receive() {
        // Nothing to do
    }

    get fun test1(): Int {
        try {
            nativeThrow(1);
        } catch (_) {
            return 0;
        }
        return 1;
    }

    get fun test2(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 2);
        m.set(2, 4);
        m.set(3, 6);
        let x: Int = 0;
        foreach (_, v in m) {
            x += v;
        }
        return x;
    }

    get fun test3(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 2);
        m.set(2, 4);
        m.set(3, 6);
        let x: Int = 0;
        foreach (k, _ in m) {
            x += k;
        }
        return x;
    }
}