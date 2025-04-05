contract Test1 {
    const CALC: Int = 5 + 2 * 3; // expected result: 11
    
    receive() {
         let r: Int = self.CALC;
    }
}
