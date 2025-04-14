primitive Int;

trait BaseTrait {}

trait TraitA {
    abstract fun f(): Int;
}

trait TraitB {
    virtual fun f(): Int {
        return 2;
    }
}

contract TestContract with TraitA, TraitB {
    fun f(): Int {}
}
