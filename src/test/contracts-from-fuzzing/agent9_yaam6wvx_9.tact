// Snippet 1: OrderTest - Test that struct literal order does not matter
struct OrderTest {
    a: Int;
    b: Int;
}

fun main() : Int {
    let o = OrderTest{ b: 20, a: 10 };
    return o.a + o.b; // Expected: 10 + 20 = 30
}
