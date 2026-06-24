const TON1: Int = ton("1");

contract Test() {
    get fun test(): Int {
        // Since ton("1") is 1,000,000,000, adding 1 should yield 1000000001
        return TON1 + 1;
    }
}
