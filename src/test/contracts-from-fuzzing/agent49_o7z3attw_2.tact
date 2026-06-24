const VAL: Int = ascii("⚡");

contract Test {
    receive() {
        // Reference the global constant VAL
        let x = VAL;
    }
}
