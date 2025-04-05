trait Fee {
    virtual const MY_FEE: Int = ton("1.0");
}

contract Test with Fee {
    override const MY_FEE: Int = ton("0.5");

    receive() {}
}
