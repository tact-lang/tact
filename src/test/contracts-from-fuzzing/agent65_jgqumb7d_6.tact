// TestConst1: Basic constant arithmetic evaluation
const A: Int = 10 + 5 * 2;

contract TestConst1 {
    receive() {
        let result: Int = A;
    }
}
