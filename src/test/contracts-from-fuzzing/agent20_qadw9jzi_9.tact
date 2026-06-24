trait MyAbstractTrait {
    abstract const MY_DEV_FEE: Int;
}

contract TestAbstract with MyAbstractTrait {
    override const MY_DEV_FEE: Int = ton("1000");

    receive() {
        if (self.MY_DEV_FEE == ton("1000")) {
            // abstract constant override works
        }
    }
}
