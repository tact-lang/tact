trait TraitA {
    fun f(arg: Int): Int {
        return arg + 1;
    }
}

trait TraitB {
    fun f(arg: Int): Int {
        return arg * 3;
    }
}

contract TestContract() with TraitA, TraitB {
    override fun f(arg: Int): Int {
        // Choose TraitA's implementation.
        return arg + 1;
    }

    receive() {
        let res = self.f(10);
        dump(res);
    }
}
