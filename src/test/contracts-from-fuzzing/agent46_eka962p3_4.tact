trait TraitA {
    virtual fun foo(): Int {
        return 10;
    }
}

trait TraitB {
    virtual fun foo(): Int {
        return 20;
    }
}

contract MultiTrait() with TraitA, TraitB {
    // Explicitly override foo to resolve conflict
    override fun foo(): Int {
        // For instance, choose TraitA's implementation
        return 10;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}
