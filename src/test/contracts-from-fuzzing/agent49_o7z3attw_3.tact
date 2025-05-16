const ONE_TON: Int = ton("1");

contract Test {
    receive() {
        // Use the constant ONE_TON computed at compile time
        let x = ONE_TON;
    }
}
