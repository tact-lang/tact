contract SelfCodeTest {
    receive() {
        let code1: Cell = myCode();
        let code2: Cell = codeOf SelfCodeTest;
        // The code obtained via myCode() should match codeOf for the current contract
    }
}
