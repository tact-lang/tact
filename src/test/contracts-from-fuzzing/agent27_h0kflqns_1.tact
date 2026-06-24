const TON_ONE: Int = ton("1");

contract Test {
    receive() {
        dump(TON_ONE);
    }
}
