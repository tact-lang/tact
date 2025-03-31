fun test1() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 42);
    return m.get(1)!!;
}

// Dummy main to call test1
fun main() : Int {
    return test1();
}
