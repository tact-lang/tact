contract ContractParam(param: Int) {
    receive() {}
}

contract Test2 {
    receive() {
        // Test for a contract with parameters: correct usage
        let x = initOf ContractParam(42);
        let y = codeOf ContractParam;
        x;
        y;
    }
}
