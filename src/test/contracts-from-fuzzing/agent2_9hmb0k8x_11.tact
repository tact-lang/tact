/* Test 27: Field punning with explicit return type
   Expected: should compile and return 12
*/

struct PopQuiz {
    a: Int;
    b: Int;
}

fun test() : Int {
    let a: Int = 5;
    let b: Int = 7;
    let res = PopQuiz { a, b };
    return res.a + res.b;
}
