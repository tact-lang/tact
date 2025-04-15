primitive Int;

trait BaseTrait {}

trait TraitA {
    abstract fun f(): Int;
}

trait TraitB {
    abstract fun f(): Int;
}

contract TestContract with TraitA, TraitB {
    fun f(): Int {}
}
