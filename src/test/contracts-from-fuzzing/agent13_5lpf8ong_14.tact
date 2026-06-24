trait MyAbstract {
    abstract const X: Int;
}

contract AbstractImpl with MyAbstract {
    override const X: Int = 10;
    val: Int = self.X;

    receive() {}
}
