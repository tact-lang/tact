struct Pair { a: Int; b: Int; }

contract TestGetterReturns {
    get fun getPair(flag: Bool): Pair {
         if (flag) {
             return Pair { a: 10, b: 20 };
         } else {
             return Pair { a: 30, b: 40 };
         }
    }
}
