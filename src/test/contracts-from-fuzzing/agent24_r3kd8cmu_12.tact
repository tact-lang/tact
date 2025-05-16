contract MultConstant {
    const MULT: Int = 42 * ton("1");
    
    receive() {
        let m: Int = self.MULT;
    }
}
