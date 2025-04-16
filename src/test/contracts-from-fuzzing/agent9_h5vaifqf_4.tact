// Test 1: Simple try-catch with return
fun simpleTry() : Int {
    try {
        throw(1042);
    } catch (e) {
        return e; // should return 1042
    }
}

fun main() {
    dump(simpleTry());
}
