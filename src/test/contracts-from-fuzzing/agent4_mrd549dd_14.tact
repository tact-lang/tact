/* Test 14: OutOfRange rejection
   This test attempts to assign a value (16) that is exactly equal to the upper bound for a uint4 field. 
   The expected behavior is that the compiler should reject this, as valid values are 0 to 15.
*/

struct OutOfRange16 {
    val: Int as uint4;
}

fun main() {
    let o = OutOfRange16{ val: 16 };
}
