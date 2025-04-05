trait Trait1 {
    // Abstract function: must be implemented
    abstract fun f(): Int;
    
    // Virtual function: returns self.f() + 1
    virtual fun g(): Int {
        return self.f() + 1;
    }
}

trait Trait2 {
    // Abstract function, same signature expected
    abstract fun f(): Int;
    
    // Virtual function: returns self.f() * 2
    virtual fun h(): Int {
        return self.f() * 2;
    }
}

contract Test() with Trait1, Trait2 {
    // Override the abstract function from both traits
    override fun f(): Int {
        return 10;
    }
    
    receive() {
        // Validate methods
        require(self.f() == 10, "f error");
        require(self.g() == 11, "g error");
        require(self.h() == 20, "h error");
        cashback(sender());
    }
}
