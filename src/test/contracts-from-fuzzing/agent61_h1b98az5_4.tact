contract Test {
    const CONTRACT_CONST: Int = 5 * 2;
    
    get fun value(): Int {
        return self.CONTRACT_CONST + 10;
    }
}
