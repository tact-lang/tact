contract ContractWithParams(param1: Int, param2: Int) {
    // Using contract parameters, no init() allowed
    receive() {}
}

contract Test {
    receive() {
        // Valid usage for contract with parameters
        let init_p = initOf ContractWithParams(3, 4);
        let code_p = codeOf ContractWithParams;
    }
}
