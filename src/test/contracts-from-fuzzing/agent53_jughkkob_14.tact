///////////////////////////////////////////////
// Test 15: Destructuring assignment using wildcard as discard in proper position

struct Two { first: Int; second: String }

contract TestDestruct {
    fun test(s: Two): Int {
         // Discard second field
         let Two { first, second: _ } = s;
         return first;
    }
    
    receive() {}
}
