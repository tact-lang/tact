trait T1 {
    // Virtual constant with default compile-time value
    virtual const A: Int = ton("1");
    
    // Function that uses the constant A
    fun incA(): Int {
        return self.A + 1;
    }
}

trait T2 with T1 {
    // Override the virtual constant A
    override const A: Int = ton("2");
    
    // Function that uses the overridden constant A
    fun doubleA(): Int {
        return self.A * 2;
    }
}

// Define a struct to hold the results, because getters cannot return tuples directly
struct Result {
    inc: Int;
    doub: Int;
}

contract TestContract() with T2 {
    // Override a getter that returns a struct with two values
    get fun result(): Result {
        return Result{ inc: self.incA(), doub: self.doubleA() };
    }
    
    // Minimal receiver so the contract is considered used
    receive() {
        cashback(sender());
    }
}
