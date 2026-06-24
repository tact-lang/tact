struct Pair { a: Int; b: Int }

contract Test5 {
    get fun f(x: Int): Pair {
         if (x > 0) {
             return Pair { a: x, b: 0 };
         } else {
             return Pair { a: 0, b: -x };
         }
    }
    
    receive() {}
}
