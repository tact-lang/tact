primitive Int;

const B: Int = 456;

fun testFunction(): Int {
    let a: Int = 123;
    repeat (a) {
        let B: Int = a + 3;
    }
    return a;
}