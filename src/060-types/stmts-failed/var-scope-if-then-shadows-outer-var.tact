primitive Int;

fun testFunction(): Int {
    let a: Int = 123;
    let b: Int = 456;
    if (true) {
        let a: Int = 2;
    } else {
        // do nothing
    }
    return b;
}