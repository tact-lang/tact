contract TestCodeOf {
    fun test() {
        // Test that the codeOf operator returns a Cell representing the code of the contract.
        let c: Cell = codeOf MyTestContract;
        dump(c);
    }
    
    receive() {
        self.test();
    }
}

contract MyTestContract() {}
