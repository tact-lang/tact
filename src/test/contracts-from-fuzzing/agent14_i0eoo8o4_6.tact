trait TraitC {
    abstract const X: Int;
}

contract ContractC() with TraitC {
    override const X: Int = 42;
    receive() { let a = self.X; }
}
