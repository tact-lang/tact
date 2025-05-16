trait TraitA {
    abstract const X: Int;
}

trait TraitB {
    abstract const X: Int;
}

contract TestContract() with TraitA, TraitB {
    override const X: Int = 42;

    receive() {
        dump(self.X);
    }
}
