primitive Int;

fun testFunction(): Int {
    let a: Int = 123;
    let b: Int = 456;
    do {
        let b: Int = a + 3;
    } until (false);
    return a;
}