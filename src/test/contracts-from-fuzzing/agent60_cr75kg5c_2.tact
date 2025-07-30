contract TestTon() {
    fun getTon() : Int {
        // Should evaluate ton("1") to 1000000000
        return ton("1");
    }
    
    receive() {
        // Correctly call the member function using self
        self.getTon();
    }
}