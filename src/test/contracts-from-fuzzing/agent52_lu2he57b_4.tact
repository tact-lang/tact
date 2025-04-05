trait Base {
    // A virtual constant in the base trait
    virtual const K: Int = 1;
}

// Derived1 inherits from Base
trait Derived1 with Base {}

// A contract inheriting Derived1 (and indirectly Base) and overriding K
contract C() with Derived1 {
    override const K: Int = 10;

    // A receiver that tests the value of K
    receive() {
         let v: Int = self.K; // Expect v = 10
         // Do something with v (here simply ensuring the method is used)
         cashback(sender());
    }
}
