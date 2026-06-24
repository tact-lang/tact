contract MultiParam(x: Int, y: Int) {
    // No explicit init, using contract parameters
}

contract TestMultiParam {
    receive() {
        // Using initOf with multiple parameters and a trailing comma
        let state = initOf MultiParam(1, 2,);
        let code_cell = codeOf MultiParam;
    }
}
