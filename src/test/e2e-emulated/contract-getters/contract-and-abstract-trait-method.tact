trait TraitA {
    abstract fun compute(): Int;
    virtual fun getValue(): Int {
        return 10;
    }
}

trait TraitB with TraitA {
    override fun getValue(): Int {
        return self.compute();
    }
}

contract Test with TraitB {
    override fun compute(): Int {
        return 20;
    }

    receive() {}

    get fun getCompute(): Int { return self.compute() }
    get fun getVal(): Int { return self.getValue() }
}
