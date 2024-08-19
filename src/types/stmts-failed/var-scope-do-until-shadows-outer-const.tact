primitive Int;

const B: Int = 456;

fun testFunction(): Int {
    let a: Int = 123;
    do {
        let B: Int = a + 3;
    } until (false);
    return a;
}