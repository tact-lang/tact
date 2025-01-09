primitive Int;

fun testFunction(): Int {
    let a: Int = 123;
    let b: Int = 456;
    repeat (a) {
        let c: Int = a + b;
    }
    return a + b;
}