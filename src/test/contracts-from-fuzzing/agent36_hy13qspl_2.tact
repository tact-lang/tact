trait Trait1 {
    abstract fun g(): Int;
}

trait Trait2 {
    abstract fun g(): Int;
}

contract C() with Trait1, Trait2 {
    override fun g(): Int { return 100; }
    
    receive() {
        dump(self.g());
    }
}
