contract Test1 {
    fun f(x: Int): Int {
        if (x > 0) { return x; }
        return -x;
    }
}

contract TestNested {
    fun f(x: Int): Int {
        {
            if (x == 42) { return x + 1; }
        }
        return x;
    }
}

contract TestLoop {
    fun f(x: Int): Int {
        repeat (3) {
            if (x > 10) { return x; }
        }
        return x + 1;
    }
}

contract TestMultiple {
    fun f(flag: Bool): Int {
        if (flag) { return 1; } else { return 2; }
    }
}

contract TestGetter {
    v: Int = 0;

    get fun getV(): Int {
        if (self.v == 0) { return 100; }
        return self.v;
    }
}

struct MyTuple { a: Int; b: Int }

contract TestGetterTuple {
    v: Int = 0;

    get fun getPair(): MyTuple {
        if (self.v > 10) { 
            return MyTuple { a: self.v, b: self.v + 1 };
        }
        return MyTuple { a: self.v - 1, b: self.v - 2 };
    }
}

contract TestComplex {
    fun f(x: Int): Int {
        if (x > 100) {
            { return x; }
        } else {
            repeat (2) {
                if (x == 50) { return 50; }
            }
        }
        return 0;
    }
}

contract TestReceiver {
    receive(msg: Slice) {
        // Simply return; testing that return in receivers is allowed
        return;
    }
}

contract TestOptional {
    fun f(x: Int): Int? {
        if (x > 0) { return x; }
        return null;
    }
}
