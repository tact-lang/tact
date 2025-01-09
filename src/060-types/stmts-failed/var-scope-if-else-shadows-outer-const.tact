primitive Int;

const A: Int = 123;

fun testFunction(): Int {
    let b: Int = 456;
    if (true) {
        // do nothing
    } else {
        let A: Int = 2;
    }
    return b;
}