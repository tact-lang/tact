contract TestArithmetic {
    const BASE: Int = 5;
    const MULTI: Int = self.BASE * 3 + 2;
    
    receive() {
        // Use MULTI in runtime code
        let y: Int = self.MULTI;
    }
}
