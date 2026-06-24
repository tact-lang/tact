contract TestTonExpression() {
    fun run() {
        let tonValue = ton("1");
        // In TON, 1 Toncoin = 1_000_000_000 nanoToncoin
        require(tonValue == 1000000000, "ton('1') did not produce 1_000_000_000");
    }
    
    receive() {
         self.run();
    }
}
