fun testTernary1(): Int {
    return true ? 10 : 20;
}

fun testTernary2(): Int {
    return false ? 100 : true ? 200 : 300;
}

contract TernaryExpressionsTest {
    receive() {
        let a: Int = testTernary1();
        let b: Int = testTernary2();
    }
}
