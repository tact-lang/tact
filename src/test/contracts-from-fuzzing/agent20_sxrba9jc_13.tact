/* Test 11 (revised syntax): Valid destructuring assignment with wildcard in a struct.
   The wildcard discards the 'b' field, and only 'a' is bound.
*/

struct S {
    a: Int;
    b: Int;
}

contract Test {
    fun test() : Int {
        let S { a, b: _ } = S { a: 10, b: 20 };
        return a;
    }

    receive() {}
}
