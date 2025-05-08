// Test Case: Computed Top-Level Constants
const A: Int = 10;
const B: Int = A * 2;

contract Test {
    receive() {
        let res: Int = B / 2;
    }
}
