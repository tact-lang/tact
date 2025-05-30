contract TestInside {
    const CONTRACT_CONST: Int = 100;
    
    receive() {
        dump(self.CONTRACT_CONST);
    }
}
