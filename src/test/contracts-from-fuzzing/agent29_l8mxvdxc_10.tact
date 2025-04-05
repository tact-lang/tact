contract Arithmetic {
    const SUM: Int = 10 + 5 * 2;
    
    receive() {
        require(self.SUM == 20, "Sum must equal 20");
    }
}
