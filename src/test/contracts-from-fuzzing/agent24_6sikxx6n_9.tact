trait A {
    virtual fun f(): Int {
         return 1;
    }
    abstract fun g(): Int;
}

contract B() with A {
    override fun g(): Int {
        return self.f() + 2;
    }
    
    // Getter function to test behavior; expected result is 1 + 2 = 3
    get fun test(): Int {
        return self.g();
    }
}

// Expected: Deploying contract B and calling test() should return 3.