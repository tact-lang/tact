contract Test {
    const VAL: Int = 5 + 3;
    
    receive() {
        let x: Int = self.VAL * 2;
    }
}
