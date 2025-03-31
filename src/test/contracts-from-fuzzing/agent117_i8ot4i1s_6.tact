contract C(param: Int) {
    // Contract with contract parameter; uses default empty init
    receive() {}
}

contract TestParam {
    receive() {
        // Obtain initial state and code of contract C
        let state = initOf C(42);
        let code = codeOf C;
        // Use the results (e.g., access fields) to avoid unused variable warnings
        state.data;
        code;
    }
}
