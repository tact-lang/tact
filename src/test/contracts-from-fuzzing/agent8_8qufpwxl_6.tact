trait TraitConst {
    virtual const VALUE: Int = 10;

    fun getValue(): Int {
        return self.VALUE;
    }
}

contract TestConst() with TraitConst {
    override const VALUE: Int = 20;

    receive() {
        let v = self.getValue(); // Expected to be 20
        return;
    }
}
