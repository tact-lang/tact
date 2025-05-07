primitive Int;

trait BaseTrait {}

trait TraitA {
    fun f(): Int {
        return 1;
    }
}

trait TraitB with TraitA {}

trait TraitC with TraitA {}

contract TestContract with TraitB, TraitC {}
