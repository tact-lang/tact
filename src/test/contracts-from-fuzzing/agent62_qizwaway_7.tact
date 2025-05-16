struct Pair { a: Int; b: Int }

contract TestReturnTuple {
    fun test(): Pair {
         if (true) {
             return Pair { a: 1, b: 2 };
         } else {
             return Pair { a: 3, b: 4 };
         }
    }

    receive () {}
}
