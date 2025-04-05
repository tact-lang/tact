trait TraitC {
    abstract const myVal: Int;
}

contract TestContract2() with TraitC {
    override const myVal: Int = 42;
    
    receive() {
        dump(self.myVal);
    }
}
