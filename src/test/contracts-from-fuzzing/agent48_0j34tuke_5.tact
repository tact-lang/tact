const FLAG: Bool = true;

fun testBool(): Bool {
    return FLAG;
}

contract TestContract {
    receive() {
        testBool();
    }
}
