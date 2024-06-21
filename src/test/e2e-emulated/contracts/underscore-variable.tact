contract UnderscoreVariableTestContract {
    something: Int;

    init() {
        self.something = 0;
    }

    receive() {
        // Nothing to do
    }

    fun increaseSomething(): Int {
        self.something += 1;
        return 123;
    }

    get fun test1(): Int {
        try {
            nativeThrowUnless(1, false);
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

    get fun test4(): Int {
        let _: Int = self.increaseSomething();
        let _: Int = self.increaseSomething();
        let _ = self.increaseSomething();
        let _ = self.increaseSomething();
        return self.something;
    }
}