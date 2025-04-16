const A: Int = 5 + 3 * 2; // should evaluate to 11

contract TestArithmetic {
    b: Int = A - 1; // expecting 10

    receive() {
    }
}
