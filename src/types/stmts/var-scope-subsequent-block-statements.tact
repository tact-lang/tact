primitive Int;

fun testFunction(): Int {
    let b: Int = 100;
    {
        let a: Int = 456;
        b += a;
    }
    {
        let a: Int = 752;
        b += a;
    }
    return b;
}
