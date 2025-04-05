// Test A: Correct try-catch statement
contract Test {
    receive() {
        try {
            throw(101);
        } catch (err) {
            dump(err);
        }
    }
}
