struct Pair { a: Int; b: Int; }

contract TestGetterPair {
    get fun testPair(i: Int) : Pair {
         if (i > 0) {
             return Pair { a: i, b: i + 1 };
         } else if (i < 0) {
             return Pair { a: -i, b: -i + 1 };
         }
         return Pair { a: 0, b: 0 };
    }
    
    receive () {}
}
