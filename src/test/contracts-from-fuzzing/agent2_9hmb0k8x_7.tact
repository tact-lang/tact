/* Test 23: Constant Default Value Using Explicit Return Type
   We use an explicit return type for the function to check proper default initializations
   This test should compile successfully if default values for fields work as documented.
*/

const DEF: Int = 42;

struct ConstDefaultCorrect {
    x: Int = DEF;
}

fun test() : Int {
    let c = ConstDefaultCorrect {};
    return c.x;
}
