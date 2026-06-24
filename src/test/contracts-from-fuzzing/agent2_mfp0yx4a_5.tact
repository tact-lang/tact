trait A {
    // Require abstract f() to be implemented by inheriting contract
    abstract fun f(): Int;
    
    // Virtual function with default
    virtual fun g(): Int {
         return 10;
    }
    
    // Virtual constant with default value
    virtual const X: Int = 1;
}

trait B {
    // Also require abstract f(), common signature
    abstract fun f(): Int;
    
    // Virtual function with default
    virtual fun h(): Int {
         return 20;
    }
    
    // Virtual constant with default value
    virtual const Y: Int = 2;
}

// A struct to collect results
struct Res { a: Int; b: Int; c: Int; d: Int; e: Int; }

contract D() with A, B {
    // Override the abstract function f() from both traits
    override fun f(): Int {
         return 100;
    }
    
    // Override virtual function g() from trait A
    override fun g(): Int {
         return 11;
    }
    
    // Do not override h(), so default from B should apply
    
    // Override constant X from trait A, leave constant Y from trait B as is
    override const X: Int = 5;
    
    // A getter that returns a Res struct with results from functions and constants
    get fun getRes(): Res {
         return Res{
              a: self.f(),       // expected 100
              b: self.g(),       // expected 11
              c: self.h(),       // expected 20
              d: self.X,         // expected 5
              e: self.Y          // expected 2
         };
    }
}
