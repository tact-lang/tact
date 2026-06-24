trait TraitA {
    const MY_CONSTANT: Int = 10;
}

trait TraitB {
    const MY_CONSTANT: Int = 20;
}

contract TestConflict() with TraitA, TraitB {
    // Due to conflicting constant definitions in TraitA and TraitB, the contract must override it explicitly
    override const MY_CONSTANT: Int = 30;

    receive() {
        dump(self.MY_CONSTANT);
    }
}
