primitive Int;

fun testFunction(): Int {
    let a: Int = 123;
    {
        let a: Int = 456;
    }
    return a;
}
