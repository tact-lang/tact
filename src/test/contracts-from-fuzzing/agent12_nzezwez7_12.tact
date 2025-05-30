/* Test 12: Optional field not provided, defaults to null check
   Expected: Returns 42, since opt defaults to null.
*/

struct StOpt2 {
    opt: Int?;
}

fun main(): Int {
    let s = StOpt2{};
    if (s.opt == null) {
        return 42;
    } else {
        return s.opt!!;
    }
}
