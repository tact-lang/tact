contract Test {
    v: Int = 5;
    
    receive() {
        self.v += 5;
        dump(self.v);
    }
}
