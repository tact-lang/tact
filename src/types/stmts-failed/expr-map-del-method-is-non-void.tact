primitive Int;

fun testFunction1() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 2);
    return m.del(1);
}