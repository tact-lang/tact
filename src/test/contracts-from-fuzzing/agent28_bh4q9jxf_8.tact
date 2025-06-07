contract A(x: Int) {}

contract Caller {
    receive() {
        // Testing initOf on a contract with parameters and codeOf on the same contract
        let aInit = (initOf A(123));
        let aCode = (codeOf A);
    }
}
