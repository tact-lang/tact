contract SelfTest {
    receive() {
        // Testing initOf and codeOf on the current contract
        let initState: StateInit = initOf SelfTest();
        let contractCode: Cell = codeOf SelfTest;

        // Compare with myCode for current contract
        let myCodeCell: Cell = myCode();

        // For demonstration, we don't use assert, but comparing cells directly
        // In a test environment, one might emit these values or check them externally
        
        // Also checking address derivation
        let addr1: Address = myAddress();
        let addr2: Address = contractAddress(initState);
        
        // No further action; just using the expressions to verify compilation and code generation
    }
}
