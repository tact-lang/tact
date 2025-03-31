struct Pair { a: Int; b: Int }

contract C {
    get fun getPair(x: Bool): Pair {
         if (x) {
             return Pair { a: 100, b: 200 };
         } else {
             { if (!x) { return Pair { a: 300, b: 400 }; } }
         }
         return Pair { a: 500, b: 600 };
    }
}
