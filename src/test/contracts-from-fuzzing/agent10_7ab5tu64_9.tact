trait RecTrait {
    fun rec(n: Int): Int {
        if (n <= 0) {
            return 0;
        } else {
            return n + self.rec(n - 1);
        }
    }
}

contract RecTest() with RecTrait {
    get fun test(): Int {
        return self.rec(3);
    }
}
