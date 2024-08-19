primitive Int;

fun testFunction(): Int {
    let a: Int = 123;
    let b: Int = 456;
    if (true) {
        // do nothing
    } else {
        let a: Int = 2;
    }
    return b;
}