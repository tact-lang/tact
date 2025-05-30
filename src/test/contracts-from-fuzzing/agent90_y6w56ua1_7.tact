struct Pair {
    a: Int;
    b: Int;
}

contract TestTupleReturn {
    fun test(): Pair {
        if (1 == 1) {
            return Pair{ a: 1, b: 2 };
        } else {
            return Pair{ a: 3, b: 4 };
        }
    }
}
