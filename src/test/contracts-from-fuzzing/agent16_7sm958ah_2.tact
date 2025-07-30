trait T {
    // abstract function
    abstract fun foo(a: Int): Int;

    // virtual function with default body
    virtual fun bar(a: Int): Int {
         return a + 5;
    }

    // abstract constant and virtual constant
    abstract const FooConst: Int;
    virtual const BarConst: Int = 10;
}

contract C() with T {
    // Override abstract function
    override fun foo(a: Int): Int {
         return a + 10;
    }
    
    // Override abstract constant and virtual constant
    override const FooConst: Int = 20;
    override const BarConst: Int = 30;
    
    receive() {
         // Use the trait functions and constants via self
         let x = self.foo(1);  // expected: 11
         let y = self.bar(1);  // expected: 6
         let a = self.FooConst;  // expected: 20
         let b = self.BarConst;  // expected: 30
         
         require(x == 11, "Unexpected foo result");
         require(y == 6, "Unexpected bar result");
         require(a == 20, "Unexpected FooConst value");
         require(b == 30, "Unexpected BarConst value");
         
         reply("done");
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
