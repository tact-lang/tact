/* Test 13: OutOfRange for uint4 annotation
   This test checks that a value exceeding the maximum representable by uint4 (range: 0..15) is correctly rejected.
*/

struct OutOfRange {
    val: Int as uint4;
}

fun main() {
    let o = OutOfRange{ val: 20 };
}
