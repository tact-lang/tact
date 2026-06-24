trait T {
    virtual const FEE: Int = ton("1.0");
}

contract C with T {
    override const FEE: Int = ton("0.5");
    receive() {}
}
