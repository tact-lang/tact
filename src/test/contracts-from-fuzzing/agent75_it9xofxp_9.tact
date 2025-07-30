contract TestDouble(param1: Int, param2: Int) {
    receive() {}
}

contract ContainerDouble {
    receive() {
         let initPkg = initOf TestDouble(1, 2);
         let code = codeOf TestDouble;
    }
}
