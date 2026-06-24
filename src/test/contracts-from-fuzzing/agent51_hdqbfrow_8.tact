struct Pair { a: Int; b: Int }

contract GetterTest {
    v: Int = 0;

    // Getter with conditional return paths
    get fun getPair(cond: Bool): Pair {
         if (cond) {
             return Pair { a: 1, b: 2 };
         } else {
             return Pair { a: 3, b: 4 };
         }
    }
}
