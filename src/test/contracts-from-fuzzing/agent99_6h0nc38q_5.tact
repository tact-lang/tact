contract WithParams(param: Int) {
    receive() {}
}

contract TestParams {
    receive() {
         let s = initOf WithParams(42);
         let c = codeOf WithParams;
    }
}
