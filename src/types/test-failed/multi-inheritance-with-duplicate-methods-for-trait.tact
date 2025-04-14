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

trait Test with TraitA, TraitB {}
