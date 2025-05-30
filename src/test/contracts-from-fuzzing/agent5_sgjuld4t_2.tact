trait MyTrait {
    // An abstract function that must be implemented
    abstract fun trust(x: Int): Int;

    // A virtual function that can be overridden
    virtual fun verify(x: Int): Int {
        return x + 1;
    }

    // A trait-level constant defined normally
    const iAmOnTheTraitLevel: Int = 50;

    // An abstract constant that MUST be overridden
    abstract const overrideMe: Int;

    // A virtual constant that can be overridden
    virtual const youCanOverrideMe: Int = 100;
}

contract TestContract(x: Int) with MyTrait {
    // Persist the parameter as a state variable
    // By declaring a contract parameter, it is automatically a persistent state variable
    
    // Overriding the abstract function
    override fun trust(x: Int): Int {
        return x * 2;
    }

    // Overriding the virtual function
    override fun verify(x: Int): Int {
        return x + 10;
    }

    // Overriding the abstract constant and the virtual constant
    override const overrideMe: Int = 200;
    override const youCanOverrideMe: Int = 150;

    receive() {
        // Use the trait functions and constants to compute a value
        let a = self.trust(self.x);          // should be x * 2
        let b = self.verify(self.x);           // should be x + 10
        let c = self.iAmOnTheTraitLevel;        // fixed at 50
        let d = self.overrideMe;               // fixed at 200
        let e = self.youCanOverrideMe;         // fixed at 150
        let sum = a + b + c + d + e;            
        // Dummy operation: send a cashback message
        cashback(sender());
    }

    // Dummy getter to allow instantiation
    get fun data(): Int {
        return self.x;
    }
}
