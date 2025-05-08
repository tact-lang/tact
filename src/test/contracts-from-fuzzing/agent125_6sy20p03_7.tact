/// Test 2 (Revised): Using initOf and codeOf with a contract that uses contract parameters
contract WithParams(param: Int) {
    // No explicit init() function allowed with contract parameters
    receive() {}
}

contract WrapperParamsValid {
    receive() {
        // Valid: using initOf with contract parameters
        let s = initOf WithParams(42);
        let c = codeOf WithParams;
    }
}
