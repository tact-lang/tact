struct Pair { first: Int; second: Int; }

contract ReturnOptional {
    fun retOpt(flag: Bool): Int? {
        if (flag) {
            return 42;
        } else {
            return null;
        }
    }

    fun nestedBlockReturn(): Int {
        {
            let x: Int = 50;
            if (x > 40) {
                return x + 1;
            }
        }
        return 0;
    }

    fun multiPathReturn(n: Int): Int {
        if (n < 0) {
            return -1;
        } else if (n == 0) {
            return 0;
        } else {
            return n * 2;
        }
    }

    get fun getPair(): Pair {
        if (self.multiPathReturn(5) > 0) {
            return Pair{ first: 100, second: 200 };
        } else {
            return Pair{ first: 300, second: 400 };
        }
    }

    receive () {
        return;
    }
}
