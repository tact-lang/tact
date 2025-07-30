fun loopTest() {
    // Attempt to run a loop with a negative count
    repeat(-3) {
        // Loop body
    }
}

contract C() {
    receive() {
        loopTest();
        cashback(sender());
    }
}
