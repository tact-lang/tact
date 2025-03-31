/* Test 13: Struct declaration without trailing semicolon is allowed
   Expected: Compiles successfully and returns true.
*/

struct Mad { ness: Bool }

fun main(): Bool {
    let m = Mad{ ness: true };
    return m.ness;
}
