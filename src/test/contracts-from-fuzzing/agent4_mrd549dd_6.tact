/* Test 1: Order Independence in struct instantiation
   Fields can be provided in any order by naming them explicitly
*/
struct OrderTest {
    a: Int;
    b: Int;
}

fun main() {
    let t = OrderTest{ b: 2, a: 1 };
}
