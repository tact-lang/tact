struct Pair { a: Int; b: Int }

contract GetterTuple {
    get fun getPair(x: Int): Pair {
        if (x > 0) {
            return Pair { a: x, b: 2 * x };
        } else {
            return Pair { a: -x, b: -2 * x };
        }
    }
}
