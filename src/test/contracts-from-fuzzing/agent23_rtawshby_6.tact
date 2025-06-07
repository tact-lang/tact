trait A_Diamond {
    // Virtual constant
    virtual const base: Int = 10;
    
    // Virtual function using the constant
    virtual fun f(): Int {
        return self.base + 5;
    }
}

trait B_Diamond with A_Diamond {
    // Override the constant in trait B_Diamond
    override const base: Int = 20;
}

trait C_Diamond with A_Diamond {
    // Override the constant in trait C_Diamond
    override const base: Int = 30;
}

contract DiamondTest2() with B_Diamond, C_Diamond {
    // Resolve ambiguity by overriding the constant in the final contract
    override const base: Int = 40;
    
    receive() {
        // f() should now use the contract's base value: 40 + 5 = 45
        let result = self.f();
        require(result == 45, "diamond constant override error");
    }
}
