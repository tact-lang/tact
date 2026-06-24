trait AbstractConstTrait {
    // abstract constant that must be overridden in any contract using this trait
    abstract const MY_CONST: Int;

    fun getConst(): Int {
        return self.MY_CONST;
    }
}

contract TestContract() with AbstractConstTrait {
    // proper override of the required abstract constant
    override const MY_CONST: Int = 42;

    receive() {
        let a = self.getConst();
        dump(a);
    }
}
