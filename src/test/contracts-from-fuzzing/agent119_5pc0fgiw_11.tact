contract C(param: Int) {
    receive() {}
}

contract TestC {
    receive() {
         let c = codeOf C;
         c;
    }
}
