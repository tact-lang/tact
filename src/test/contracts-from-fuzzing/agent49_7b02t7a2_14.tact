contract TestPow2 {
    const TWO: Int = pow2(3);   // Expected to be 8
    
    receive() {
         let a: Int = self.TWO;
    }
}
