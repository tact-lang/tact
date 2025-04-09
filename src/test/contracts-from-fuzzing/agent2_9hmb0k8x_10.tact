/* Test 26: Literal Default Value with Correct Syntax
   Expect: compiles and returns "hello"
*/

struct LiteralDefaultCorrect {
    s: String = "hello";
}

fun test() : String {
    let l = LiteralDefaultCorrect {};
    return l.s;
}
