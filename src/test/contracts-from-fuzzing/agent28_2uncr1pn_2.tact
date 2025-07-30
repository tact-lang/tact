trait TraitX {
    abstract fun abstractFunc(x: Int): Int;
    virtual fun virtualFunc(x: Int): Int {
        return x + 10;
    }
}

contract Test() with TraitX {
    override fun abstractFunc(x: Int): Int {
        return x * 2;
    }
    
    override fun virtualFunc(x: Int): Int {
        return x + 100;
    }

    get fun getResult(): Int {
        let a = self.abstractFunc(5);
        let b = self.virtualFunc(5);
        return a + b;
    }
}
