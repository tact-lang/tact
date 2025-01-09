primitive Int;
primitive Bool;

fun testFunction1(): Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 2);
    return m.exists(1);
}

fun testFunction2(): Bool {
    let m: map<Int, Int as uint8> = emptyMap();
    m.set(1, 2);
    return m.exists(2);
}