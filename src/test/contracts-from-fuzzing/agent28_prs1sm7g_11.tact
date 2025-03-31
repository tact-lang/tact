contract TestCodeOf {
    // This contract tests that myCode() is equivalent to codeOf TestCodeOf.
    // According to the documentation, if you call codeOf on the current contract, it should be equivalent to myCode().
    receive() {
        let code1: Cell = myCode();
        let code2: Cell = codeOf TestCodeOf;
        // Instead of converting to string, use direct cell equality check.
        require(code1 == code2, "Code mismatch");
        cashback(sender());
    }
}

contract TestContractHash {
    // This contract tests that the contractHash function produces an account ID
    // such that newAddress(0, contractHash(...)) equals the address computed by contractAddress.
    fun testHash(): Bool {
        let s: StateInit = initOf TestContractHash();
        let h: Int = contractHash(s.code, s.data);
        let addr1: Address = newAddress(0, h);
        let addr2: Address = contractAddress(s);
        return addr1 == addr2;
    }
}
