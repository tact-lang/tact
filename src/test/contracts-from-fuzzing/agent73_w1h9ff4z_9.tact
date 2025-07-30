contract TestGetterMod {
    a: Int = 0;
    
    receive() {}
    
    // Getter that modifies the state variable 'a'. Note that although this modification occurs
    // during the execution of the getter, it won't persist in the contract's state after execution.
    get fun inc(): Int {
        self.a += 1;
        return self.a;
    }
}
