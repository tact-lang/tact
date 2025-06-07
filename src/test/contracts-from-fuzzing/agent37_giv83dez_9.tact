trait MyAbs {
    abstract const VALUE: Int;
}

contract TestAbstractConst with MyAbs {
    override const VALUE: Int = 999;

    get fun getter(): Int {
        return self.VALUE;
    }
}
