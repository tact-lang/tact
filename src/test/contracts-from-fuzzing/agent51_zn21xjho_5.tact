contract C(param: Int) {
    // No init, relies on contract parameters
    receive() {}
}

contract TestC {
    receive() {
        let s = initOf C(123);
        let c = codeOf C;
    }
}
