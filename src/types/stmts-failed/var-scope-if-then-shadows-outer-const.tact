primitive Int;

const A: Int = 123;

fun testFunction(): Int {
    let b: Int = 456;
    if (true) {
        let A: Int = 2;
    } else {
        // do nothing
    }
    return b;
}
