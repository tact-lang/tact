trait T {
    abstract const A: Int;
}

contract C() with T {
    override const A: Int = 1;
    receive() {
        cashback(sender());
    }
}
