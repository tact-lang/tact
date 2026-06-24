trait TraitConst {
    const TRAIT_CONST: Int = 10;
    abstract const ABSTRACT_CONST: Int;
    virtual const VIRTUAL_CONST: Int = 20;
}

contract TestConst() with TraitConst {
    override const ABSTRACT_CONST: Int = 5;
    override const VIRTUAL_CONST: Int = 25;

    receive() {
        let sum = self.TRAIT_CONST + self.ABSTRACT_CONST + self.VIRTUAL_CONST;
        require(sum == 10 + 5 + 25, "Unexpected constant sum");
        cashback(sender());
    }
}
