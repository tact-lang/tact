primitive Int;

trait BaseTrait {}

trait TraitA {
    fun f(): Int {
        return 1;
    }
}

trait TraitB {
    fun f(): Int {
        return 2;
    }
}

trait TraitC with TraitB {}

contract TestContract with TraitA, TraitC {}
