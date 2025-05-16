/* Test 9: Using '_' in a destructuring assignment to discard a field in a struct */

struct Pair { first: Int; second: Int; }

contract Test {
    fun getFirst(): Int {
         let p = Pair { first: 10, second: 20 };
         let Pair { first, second: _ } = p; // discard second field
         return first;
    }
    receive() { self.getFirst(); }
}
