contract TestParams(param1: Int, param2: Int) {
    receive() {
       let s: StateInit = initOf TestParams(1, 2);
    }
}
