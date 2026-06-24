/* Test Case 1: Valid usage of initOf and codeOf for a contract with an implicit empty init */
contract A {}

contract Test {
    receive() {
        // Using initOf with empty parentheses
        let stateInit = initOf A();
        // Using codeOf without parentheses
        let codeCell = codeOf A;
    }
}
