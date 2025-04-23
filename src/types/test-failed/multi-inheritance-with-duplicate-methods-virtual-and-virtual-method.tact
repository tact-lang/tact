primitive Int;

trait BaseTrait {}

trait TraitA {
    virtual fun f(): Int {
        return 3;
    }
}

trait TraitB {
    virtual fun f(): Int {
        return 2;
    }
}

contract TestContract with TraitA, TraitB {
    override fun f(): Int {}
}
