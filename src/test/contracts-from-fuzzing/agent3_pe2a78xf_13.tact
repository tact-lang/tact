trait TraitA {
    const X: Int = 1;
}

trait TraitB {
    const X: Int = 2;
}

contract TestConstants() with TraitA, TraitB {
    // Resolve conflict by overriding the constant
    override const X: Int = 3;

    receive() {
        dump(self.X); // Expect to dump 3
    }
}
