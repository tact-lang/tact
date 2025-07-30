trait B {
    abstract const x: Int
}
contract C with B {
    override const x: Int = 5;
    receive() {}
}