// Test 1: Valid map with Int as key and value (already compiled earlier, but repeating for thoroughness)
fun test_valid_int_int() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(42, 100);
    return m.get(42)!!;
}

fun main() : Int {
    return test_valid_int_int();
}
