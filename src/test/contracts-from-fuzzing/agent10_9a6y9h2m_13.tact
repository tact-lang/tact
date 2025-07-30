contract ConstArithmetic {
    const A: Int = 10;
    const B: Int = 20;

    receive() {
         // Compute arithmetic on constants: expected 10+20=30, 10*20=200, and total 230
         let sum: Int = self.A + self.B;
         let prod: Int = self.A * self.B;
         sum + prod; 
    }
}
