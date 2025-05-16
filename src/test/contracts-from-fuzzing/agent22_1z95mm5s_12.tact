contract Test2 {
    const A: Int = 55;
    
    receive() {
        if (self.A > 50) { }
    }
}
