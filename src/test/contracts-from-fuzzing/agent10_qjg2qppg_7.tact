trait TraitC {
    fun getVal(): Int {
        return 1;
    }
}

trait TraitD {
    fun getVal(): Int {
        return 2;
    }
}

contract Diamond2() with TraitC, TraitD {
    // Override the conflicting getVal to resolve diamond inheritance
    override fun getVal(): Int {
        return 3;
    }

    receive() {
        let v = self.getVal();
        require(v == 3, "fail");
        cashback(sender());
    }
}
