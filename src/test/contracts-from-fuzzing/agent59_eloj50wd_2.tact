message MyMsg { someVal: Int as uint8; }

trait TraitA {
    // Abstract function
    abstract fun foo(msg: MyMsg);
    // Virtual function with default implementation
    virtual fun bar(msg: MyMsg) {
        dump(msg.someVal);
    }
    // Trait-level constant (non-abstract)
    const A: Int = 10;
    // Abstract constant
    abstract const B: Int;
    // Virtual constant with default value
    virtual const C: Int = 20;
}

trait TraitB {
    fun dummy() {
         dump("dummy");
    }
}

contract Contract1() with TraitA, TraitB {
    // Override abstract function
    override fun foo(msg: MyMsg) {
       dump(msg.someVal * 2);
    }
    // Override abstract constant
    override const B: Int = 5;
    // Override virtual constant
    override const C: Int = 30;
    // Override virtual function bar
    override fun bar(msg: MyMsg) {
       dump(msg.someVal + 1);
    }

    receive(msg: MyMsg) {
         self.foo(msg);
         self.bar(msg);
         dump(self.A);
         dump(self.B);
         dump(self.C);
    }
}
