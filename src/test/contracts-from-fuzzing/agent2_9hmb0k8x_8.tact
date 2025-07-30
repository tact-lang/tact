/* Test 24: Optional Field Handling
   Verify that a struct field of an optional type can be instantiated as null and properly compared.
*/

struct OptTest {
    x: Int?;
}

fun test() : Int {
    if (OptTest { x: null }.x == null) {
        return 0;
    } else {
        return 1;
    }
}
