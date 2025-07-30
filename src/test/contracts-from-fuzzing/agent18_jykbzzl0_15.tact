contract Test {
    v: Int = 10;
    
    // get fun declared getter is defined
    get fun getInt(): Int {
        return self.v;
    }
    
    receive() {
        // Attempt calling the getter function from within a receiver
        // This is an edge case, since getters are meant for off-chain use only.
        let a = self.getInt();
    }
}
