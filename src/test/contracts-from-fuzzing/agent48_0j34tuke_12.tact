const A: Int = B + 1;
const B: Int = 1;

fun testA(): Int {
    return A;
}

contract TestContract7 {
    receive() {
        testA();
    }
}
