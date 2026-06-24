contract TestArithmetic {
    const ADD: Int = 45 + 55;
    
    receive() {
        let r: Int = self.ADD;
    }
}
