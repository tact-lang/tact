// Test Case 1: Global constant usage

const G: Int = 10;

contract ConstGlobalTest {
    receive() {
        let sum: Int = G + 5;
        dump(sum);
    }
}
