contract WithParam(param: Int) {
    receive() {}
}

contract Test2 {
    receive() {
         let st = initOf WithParam(42);
         let c = codeOf WithParam;
    }
}
