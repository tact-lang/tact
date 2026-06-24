struct Pair { first: Int; second: Int; }

contract ReturnTest {
    fun nestedReturn(): Int {
        {
            let a: Int = 100;
            if (a > 50) { return a; }
        }
        return 0;
    }

    fun conditionalReturn(flag: Bool): Int {
        if (flag) { return 1; } else { return 0; }
    }

    get fun validGetter(): Pair {
        if (self.nestedReturn() > 50) { return Pair{ first: 10, second: 20 }; }
        return Pair{ first: 30, second: 40 };
    }

    receive () {
        return;
    }
}
