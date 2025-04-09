contract WithParams(x: Int) {
    // Contract with parameters and no explicit init
    receive() {}
}

contract CallerParams {
    receive() {
        // Valid usage: using initOf with contract parameters
        let state_cell = initOf WithParams(123);
        let code_cell = codeOf WithParams;
    }
}
