fun test_basic_map() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    m.set(2, 200);
    let a = m.get(1)!!;
    let b = m.get(2)!!;
    return a + b; // Expects 300
}

fun main() : Int {
    return test_basic_map();
}
