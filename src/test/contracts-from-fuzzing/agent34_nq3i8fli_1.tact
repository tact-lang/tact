const TON_ONE: Int = ton("1");

contract TestTON() {
    receive() {
        // This should dump the value of ton("1"), which is 1000000000
        dump(TON_ONE);
    }
}
