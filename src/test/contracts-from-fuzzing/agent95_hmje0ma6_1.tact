contract Test {
    v: Int = 42;
    
    receive() {}

    // A getter function that returns a primitive Int value
    get fun get_v(): Int {
        return self.v;
    }
}
