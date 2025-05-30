fun double(x: Int): Int { return x * 2; }

contract Test {
    receive() {
        // Testing function call expressions
        dump(double(5));         // Expected output: 10
        dump(double(double(5)));   // Expected output: 20
        dump(double((3 + 2)));     // Expected output: 10
    }
}
