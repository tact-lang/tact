primitive Int;
trait BaseTrait {}

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

contract C with TraitB {
    override fun compute(): Int {
        return self.getValue();
    }

    receive() {
        // nothing
    }
}
