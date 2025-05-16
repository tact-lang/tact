contract WithParams(x: Int, y: Int) {
    receive() {}
}

contract TestParamsValid {
    receive() {
         let s = initOf WithParams(10, 20);
         let c = codeOf WithParams;
    }
}
