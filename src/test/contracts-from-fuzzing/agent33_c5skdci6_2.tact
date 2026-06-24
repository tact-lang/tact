trait TraitA {
    fun foo(): Int {
        return 1;
    }
}

trait TraitB {
    fun foo(): Int {
        return 2;
    }
}

contract TestOverride() with TraitA, TraitB {
    override fun foo(): Int {
        return 42; // disambiguation by explicit override
    }

    receive() {
        acceptMessage();
    }
}
