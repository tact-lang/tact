contract CodeTest {
    receive() {
        // Comparing myCode() with codeOf for the current contract
        let codeA = myCode();
        let codeB = codeOf CodeTest;
        codeA == codeB;
    }
}
