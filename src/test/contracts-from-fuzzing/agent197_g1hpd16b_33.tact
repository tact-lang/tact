trait WithConstant {
    virtual const X: Int = 1;
}

contract OverrideConst() with WithConstant {
    override const X: Int = 42;
}