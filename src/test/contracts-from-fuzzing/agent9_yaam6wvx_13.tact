/// Optional Test: Testing optional field equality and default assignment
struct OptionalTest {
    maybe: Int?;
}

fun main() : Int {
    let o = OptionalTest{ maybe: null };
    if (o.maybe == null) {
        return 1; // Expected: 1
    } else {
        return 0;
    }
}
