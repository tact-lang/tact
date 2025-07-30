contract B {}

contract Caller {
    receive() {
        // Valid usage with a contract having no init parameters
        let bInit = initOf B();
        let bCode = codeOf B;
    }
}
