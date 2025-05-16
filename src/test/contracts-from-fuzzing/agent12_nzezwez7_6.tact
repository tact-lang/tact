/* Test A: Optional field correct usage with non-null assertion
   Expected: Compiles successfully and returns 16.
*/

struct StOpt {
    opt: Int?;
}

fun main(): Int {
    let s = StOpt{ opt: 15 };
    return s.opt!! + 1;
}
