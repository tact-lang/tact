primitive Int;

trait BaseTrait {}

trait TraitA {
    fun f(): Int {
        return 1;
    }
}

trait TraitB with TraitA {
    fun g(): Int {
        return 2;
    }
}

trait TraitC with TraitB {
    fun h(): Int {
        return 3;
    }
}

contract TestContract with TraitC {
    fun f(): Int {
        return 4;
    }
}
