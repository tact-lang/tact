trait MyTrait {
    // A virtual constant with a default value
    virtual const k: Int = 100;
}

contract TestContract() with MyTrait {
    // Override the virtual constant
    override const k: Int = 200;
    
    // A getter to return the value of k
    get fun getK(): Int {
        return self.k;
    }
    
    // A receiver to force evaluation
    receive() {
        let value = self.getK(); // expected value: 200
        // Use the value in a dummy calculation to avoid optimization removal
        if (value != 200) { throw(1); }
        cashback(sender());
    }
}
