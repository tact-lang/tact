trait TraitA {
    abstract fun f(): Int;
}

trait TraitB with TraitA {
    override fun f(): Int {
         return 10;
    }
}

contract TestContract2() with TraitB {
    override fun f(): Int {
         return 20;
    }
    receive() {
         dump(self.f());
         cashback(sender());
    }
}
