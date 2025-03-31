contract Test {
    a: Int = 0;
    
    receive("inc") {
        self.a = self.a + 1;
    }
}
