contract Test {
    v: Int = 42;
    
    // receiver required to compile the contract
    receive() {}

    // Simple getter returning an Int
    get fun getInt(): Int {
        return self.v;
    }
}
