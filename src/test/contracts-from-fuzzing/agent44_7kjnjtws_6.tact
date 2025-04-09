fun testMapValid() {
    // Test valid map usage
    let m: map<Int, Int> = emptyMap();
    m.set(42, 100);
    dump(m.get(42)!!); // should output 100
}

fun main() {
    testMapValid();
}
