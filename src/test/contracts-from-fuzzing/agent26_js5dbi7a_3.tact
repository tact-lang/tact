trait TraitA {
    virtual fun fA(): Int {
        return 10;
    }
    abstract fun g(): Int;
}

trait TraitB {
    virtual fun fB(): Int {
        return 5;
    }
    abstract fun h(): Int;
}

contract MultiTrait() with TraitA, TraitB {
    override fun g(): Int {
        return 3;
    }

    override fun h(): Int {
        return 7;
    }

    fun test(): Int {
        return self.fA() + self.fB() + self.g() + self.h();
    }

    receive() {
        dump(self.test()); // should output 25
    }
}
