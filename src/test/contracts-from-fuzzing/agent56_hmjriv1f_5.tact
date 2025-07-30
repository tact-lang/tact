const A: Int = 10 + 32;
const B: Int = A * 2;

contract ConstArithmetic {
    receive() {
        dump(B); // Expected to dump 84
    }
}
