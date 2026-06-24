trait RecursiveTrait {
    virtual fun x(): Int { return self.x() + 1; }  // default definition recursively calls itself
}

contract RecursiveContract() with RecursiveTrait {
    override fun x(): Int { return 42; }  // proper override to avoid recursion
    
    receive() {
        dump(self.x());
    }
}
