fun test_valid_int_int() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 123);
    return m.get(1)!!;
}

// Entry point to run the test
fun main() : Int {
    return test_valid_int_int();
}
