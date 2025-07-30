const A: Int = 1 + 2 * 3;

contract TestContract {
    receive() {
        let y: Int = A - 5;
    }
}
