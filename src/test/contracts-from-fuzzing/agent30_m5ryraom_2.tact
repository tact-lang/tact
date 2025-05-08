contract Test {
    x: Int = 42;

    // Basic getter returning an Int, using self.x reference
    get fun getX(): Int {
        return self.x;
    }
    
    receive() {}
}
