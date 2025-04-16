/// TestExtension: Verify extension functions on Int
extends fun toDouble(self: Int): Int {
    return self * 2;
}

contract TestExtension() {
    fun main() {
        let x = 21.toDouble(); // expected: 42
        dump(x);
    }
    receive() { return; }
}
