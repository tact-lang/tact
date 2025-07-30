struct Pair {
    first: Int;
    second: Int;
}

contract TestReturn {
    fun simpleReturn(): Int {
        return 42;
    }

    fun earlyReturnInRepeat(): Int {
        repeat (5) {
            if (true) { 
                return 10;
            }
        }
        return 0;
    }

    fun nestedBlockReturn(a: Int): Int {
        if (a > 0) {
            { return a; }
        } else {
            { return -a; }
        }
    }

    fun implicitReturn(x: Bool): Int {
        if (x) { return 100; } else { return 200; }
    }

    fun optionalReturn(flag: Bool): Int? {
        if (flag) { return null; } else { return 55; }
    }
}

contract TestGetter {
    v: Int;

    init(v: Int) {
        self.v = v;
    }

    get fun getPair(): Pair {
        if (self.v > 0) {
            return Pair { first: self.v, second: self.v + 5 };
        } else {
            return Pair { first: self.v, second: self.v - 5 };
        }
    }
}
