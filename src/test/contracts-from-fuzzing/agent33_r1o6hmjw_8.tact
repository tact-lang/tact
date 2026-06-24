struct Pair { a: Int; b: Int }

contract TestGetter2 {
    get fun get_pair(x: Int): Pair {
         return Pair{ a: x, b: x + 10 };
    }
}
