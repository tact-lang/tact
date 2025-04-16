struct Pair { a: Int; b: Int }

contract TestTupleReturn {
    // Function returning a struct with nested returns
    fun getPair(x: Int): Pair {
        if (x % 2 == 0) {
            return Pair { a: x, b: x * 2 };
        } else {
            {
                return Pair { a: x, b: x * 3 };
            }
        }
    }
    
    receive () {}
}
