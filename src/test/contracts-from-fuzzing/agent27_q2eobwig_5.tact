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

contract Test() with TraitA, TraitB {
    // Must override foo to resolve conflict
    override fun foo(): Int {
        // For testing purposes, simply return a constant that indicates override happened
        return 100;
    }
    
    receive() {
        let x = self.foo();
        dump(x);
    }
}
